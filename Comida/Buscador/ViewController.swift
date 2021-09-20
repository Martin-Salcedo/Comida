//
//  ViewController.swift
//  Comida
//
//  Created by Jose Martin Salcedo on 15/03/21.
//

import UIKit

class ViewController: UIViewController, Storyboardable {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    /// definition of search bar
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    var food = [Food]()
    var filteredFood: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        emptyLabel.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "food")
        setupConfigSearchBar()
        emptyLabel.text = "No hay alimentos"
        testVariablesComputalizada()
    }
    
    /// Condig the search bar
    private func setupConfigSearchBar() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Food"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        ServiceFoodProvider.shared.getListFood(textSearch: searchText) { (data) in
            self.filteredFood = data
            self.emptyLabel.isHidden = true
            self.tableView.isHidden = false
            self.tableView.reloadData()
        } failure: { (error) in
            self.tableView.isHidden = true
            self.emptyLabel.isHidden = false
            self.emptyLabel.text = "No se encontraron resultados"
            print(error.debugDescription)
        }
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredFood.count
        }
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "food", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let nameFood = isFiltering ? filteredFood[indexPath.row] : food[indexPath.row]
        cell.titleOfFood.text = nameFood.strMeal ?? ""
        cell.categoryOfFood.text = nameFood.strCategory ?? ""
        cell.imagenView.downloaded(from: nameFood.strMealThumb ?? "")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameFood = isFiltering ? filteredFood[indexPath.row] : food[indexPath.row]
        showDetailFood(nameOfFood: nameFood.strMeal ?? "")
    }
    
    private func showDetailFood(nameOfFood: String) {
        let detailViewController = DetailViewController.instantiate()
        detailViewController.nameOfFoodSelected = nameOfFood
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func testVariablesComputalizada() {
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

        print("\n- La figura comienza en el punto (\(square.origin.x), \(square.origin.y))")

        print("\n- El centro se encuentra en el punto (\(square.center.x), \(square.center.y))")

        print("\n- El área de la figura es de \(square.area) unidades")

        let initialSquareCenter = square.center

        square.center = Point(x: 15.0, y: 15.0)

        print("\n* Movemos el centro de la figura al punto (15, 15)")

        square.size = Size(width: 300, height: 100)

        print("\n* Establecemos el tamaño de la figura a 300x100")

        print("\n- La figura comienza en el punto (\(square.origin.x), \(square.origin.y))")

        print("\n- El centro se encuentra en el punto (\(square.center.x), \(square.center.y))")

        print("\n- El área de la figura es de \(square.area) unidades")
    }
}
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //    TODO: implementar para buscar en automatico
    }
}
extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        filterContentForSearchText(text)
    }
    
    func searchBarShouldBeginEditing(_: UISearchBar) -> Bool {
        tableView.isHidden = true
        emptyLabel.isHidden = true
        return true
    }
    
    func searchBarCancelButtonClicked(_: UISearchBar) {
        tableView.isHidden = true
        emptyLabel.isHidden = true
    }
    
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

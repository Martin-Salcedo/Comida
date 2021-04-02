//
//  ViewController.swift
//  Comida
//
//  Created by Jose Martin Salcedo on 15/03/21.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  let searchController = UISearchController(searchResultsController: nil)
  
  var food = [Food]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "food")
    setupConfigSearchBar()
  }
  
  private func setupConfigSearchBar() {
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Food"
    navigationItem.searchController = searchController
    definesPresentationContext = true
    
  }
  
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    food.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "food", for: indexPath) as? TableViewCell else { return UITableViewCell() }
    let nameFood = food[indexPath.row]
    cell.titleOfFood.text = nameFood.strMeal ?? ""
    cell.categoryOfFood.text = nameFood.strCategory ?? ""
    cell.imagenView.downloaded(from: nameFood.strMealThumb ?? "")
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("selected item \(food[indexPath.row].idMeal ?? "")")
    
    //    let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    //    let navController = UINavigationController(rootViewController: VC1)
    //    navController.pushViewController(VC1, animated: true)
    //    self.present(navController, animated:true, completion: nil)
    
    //    guard let VC1 = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
    //    self.navigationController!.pushViewController(VC1, animated: true)
    
    //    let storyboard = UIStoryboard(name: "DetailViewController", bundle: NSBundle())
    //    let customViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")
    ////    self.present(customViewController, animated: true, completion: nil)
    //    let navController = UINavigationController(rootViewController: customViewController)
    //    navController.pushViewController(customViewController, animated: true)
  }
}
extension ViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text else { return }
    print("texto buscado \(text)")
//    ServiceFoodProvider.shared.getListFood(textSearch: text) { (data) in
//      self.food = data
//      self.tableView.reloadData()
//    } failure: { (error) in
//      print(error.debugDescription)
//    }
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

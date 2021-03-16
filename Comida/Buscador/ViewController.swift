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

  var food = ["tacos", "torta", "hamburgesa", "sincronizada"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = food[indexPath.row]
    return cell
  }
}
extension ViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text else { return }
    print(text)
  }
}

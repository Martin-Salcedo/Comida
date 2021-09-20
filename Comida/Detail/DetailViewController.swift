//
//  DetailViewController.swift
//  Comida
//
//  Created by Jose Martin Salcedo on 16/03/21.
//

import UIKit

class DetailViewController: UIViewController, Storyboardable {
    
    var nameOfFoodSelected: String = ""
    @IBOutlet weak var nameFoodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("el numero de food es : \(nameOfFoodSelected)")
        nameFoodLabel.text = nameOfFoodSelected
    }
    
}

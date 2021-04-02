//
//  TableViewCell.swift
//  Comida
//
//  Created by Jose Martin Salcedo on 15/03/21.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var imagenView: UIImageView!
  @IBOutlet weak var titleOfFood: UILabel!
  @IBOutlet weak var categoryOfFood: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    imagenView.contentMode = .scaleAspectFit
  }
}

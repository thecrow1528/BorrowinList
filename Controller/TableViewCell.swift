//
//  TableViewCell.swift
//  Borrowing List
//
//  Created by Mirza Durakovic on 16/11/2017.
//  Copyright © 2017 Mirza Durakovic. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCellIdentifier"

    //MARK: @IBOutltets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var borrowedLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var serialLabel: UILabel!
    
    
    
    
    func set(name:String, borrowed: String, value: Double, serial: String){
        nameLabel.text = name
        valueLabel.text = String(value) + " KM"
        borrowedLabel.text = borrowed
        serialLabel.text = serial
    }

}

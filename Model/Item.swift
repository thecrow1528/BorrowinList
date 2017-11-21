//
//  Item.swift
//  Borrowing List
//
//  Created by Mirza Durakovic on 16/11/2017.
//  Copyright © 2017 Mirza Durakovic. All rights reserved.
//

import Foundation

class Item {
    //MARK: Properties
    var name:String
    var value: Double
    var serial: String
    var borrowedTo: String
    var dateOfReturn: Date?
    //MARK: Init
    init (name: String, value: Double, serial: String, borrowedTo: String){
        self.name = name
        self.value = value
        self.serial = serial
        self.borrowedTo = borrowedTo
        }
    func returnDate(date: Date){
        self.dateOfReturn = date
    }
}

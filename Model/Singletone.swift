//
//  Singletone.swift
//  Borrowing List
//
//  Created by Mirza Durakovic on 16/11/2017.
//  Copyright © 2017 Mirza Durakovic. All rights reserved.
//

import Foundation

class MyItems {
    static var shared = MyItems()
    
    
    var items = [Item]()
    
}

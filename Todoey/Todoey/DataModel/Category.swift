//
//  Category.swift
//  Todoey
//
//  Created by Tamás Tóth on 2019. 05. 10..
//  Copyright © 2019. Tamás Tóth. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    
    let items = List<Item>()
}

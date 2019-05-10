//
//  Item.swift
//  Todoey
//
//  Created by Tamás Tóth on 2019. 05. 10..
//  Copyright © 2019. Tamás Tóth. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

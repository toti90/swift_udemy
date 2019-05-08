//
//  Item.swift
//  Todoey
//
//  Created by Tamás Tóth on 2019. 05. 08..
//  Copyright © 2019. Tamás Tóth. All rights reserved.
//

import Foundation

class Item: Encodable, Decodable {
    var title: String = ""
    var done: Bool = false
}

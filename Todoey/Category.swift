//
//  Category.swift
//  Todoey
//
//  Created by Josh Douglas on 29/4/19.
//  Copyright © 2019 Josh Douglas. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Todo>()
}

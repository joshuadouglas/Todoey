//
//  Todo.swift
//  Todoey
//
//  Created by Josh Douglas on 29/4/19.
//  Copyright © 2019 Josh Douglas. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var isChecked: Bool = false
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

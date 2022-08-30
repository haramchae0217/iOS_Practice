//
//  User.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/29.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    let todos = List<ToDo>()
    
    var hasTodos: Bool {
        return todos.count > 0
    }
    
    convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    override class func indexedProperties() -> [String] {
        return ["id", "name"]
    }
    
}

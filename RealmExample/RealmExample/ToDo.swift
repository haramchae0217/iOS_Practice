//
//  ToDo.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/28.
//

import Foundation
import RealmSwift

class ToDo: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var desc: String = ""
    let ofUser = LinkingObjects(fromType: User.self, property: "todos")
    
    convenience init(title: String, desc: String) {
        self.init()
        self.title = title
        self.desc = desc
    }
}

class IDCard: Object {
    @objc dynamic var idNumber: String = ""
    @objc dynamic var expiryDate: Date = Date.distantFuture
    let ofUser = LinkingObjects(fromType: User.self, property: "idCard")
    
    convenience init(idNumber: String) {
        self.init()
        self.idNumber = idNumber
    }
}

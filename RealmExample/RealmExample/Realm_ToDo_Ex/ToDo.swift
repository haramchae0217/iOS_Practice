//
//  ToDo.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/28.
//

import Foundation
import RealmSwift

class ToDo: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var descList: List<String>
    
    convenience init(title: String, descList: List<String>) {
        self.init()
        self.title = title
        self.descList = descList
    }
}


//
//  RealmModel.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/31.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var list: List<String>
    
    convenience init(list: List<String>) {
        self.init()
        self.list = list
    }
}

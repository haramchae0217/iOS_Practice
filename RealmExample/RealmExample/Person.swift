//
//  Person.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/28.
//

import Foundation
import RealmSwift

class Person: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var age: Int

    convenience init(name: String, age: Int) {
        self.init()
        self.name = name
        self.age = age
    }
}

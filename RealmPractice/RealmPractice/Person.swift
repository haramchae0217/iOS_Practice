//
//  Person.swift
//  RealmPractice
//
//  Created by Chae_Haram on 2022/08/29.
//

import Foundation
import RealmSwift

class Person: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var age: Int = 0
    
    convenience init(name: String, age: Int) {
        self.init()
        self.name = name
        self.age = age
    }
}

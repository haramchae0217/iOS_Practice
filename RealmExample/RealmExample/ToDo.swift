//
//  ToDo.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/28.
//

import Foundation
import RealmSwift

class ToDo: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var memo: String
    @Persisted var startDate: Date
    @Persisted var endDate: Date
    
    convenience init(title: String, memo: String, startDate: Date, endDate: Date) {
        self.init()
        self.title = title
        self.memo = memo
        self.startDate = startDate
        self.endDate = endDate
    }
}

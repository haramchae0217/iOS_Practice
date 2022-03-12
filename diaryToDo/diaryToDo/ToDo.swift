//
//  ToDo.swift
//  diaryToDo
//
//  Created by Chae_Haram on 2022/03/12.
//

import Foundation

struct ToDo {
    var title: String
    var memo: String
    var expireDate: Date = Date()
    var expireTime: Date = Date()
    
    static var ToDoList: [ToDo] = [ToDo(title: "토익", memo: "RC Day2")]
}

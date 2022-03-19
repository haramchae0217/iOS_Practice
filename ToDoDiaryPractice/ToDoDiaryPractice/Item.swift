//
//  Main.swift
//  ToDoDiaryPractice
//
//  Created by Chae_Haram on 2022/03/18.
//

import Foundation

struct Item {
    var type: String
    var title: String
    var date: Date = Date()
    
    static var itemData: [Item] = []
}
// type을 열거형으로
// main 이름 수정

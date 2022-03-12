//
//  Diary.swift
//  SimpleDiary
//
//  Created by Chae_Haram on 2022/03/12.
//

import UIKit

struct Diary {
    var content: String
    var date: Date = Date()
    var picture: UIImage
    
    static var diaryData: Diary = Diary(content: "", picture: UIImage(systemName: "folder")!)
}

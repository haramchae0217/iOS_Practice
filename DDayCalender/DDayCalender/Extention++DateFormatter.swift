//
//  Extention++DateFormatter.swift
//  DDayCalender
//
//  Created by Chae_Haram on 2022/03/06.
//

import Foundation

extension DateFormatter {
    // yyyy/MM/dd
    
    // 문자열 -> 날짜
    func toDate(target: String) -> Date {
        self.dateFormat = "yyyy/MM/dd"
        return self.date(from: target)!
    }
    
    
    // 날짜 -> 문자열
    func toString(target: Date) -> String {
        self.dateFormat = "yyyy/MM/dd"
        return self.string(from: target)
    }
}

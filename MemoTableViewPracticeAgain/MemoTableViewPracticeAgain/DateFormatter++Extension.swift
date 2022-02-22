//
//  DateFormatter++Extension.swift
//  MemoTableViewPracticeAgain
//
//  Created by Chae_Haram on 2022/02/22.
//

import UIKit

extension DateFormatter {
    static let customDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ko-KR")
        df.dateFormat = "EEEE"
        return df
    }()
}

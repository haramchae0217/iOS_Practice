import UIKit

var str: String = "2022.05.18"

func strToDate(str: String) -> Date {
    let date = DateFormatter()
    date.dateFormat = "yyyy.MM.dd"
    let strToDate = date.date(from: str)!
    
    return strToDate
}

let date = strToDate(str: str)

Calendar.current.component(.weekday, from: date)
// 7 or 1 = Sunday

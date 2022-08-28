import UIKit
import Foundation

let customDateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "yyyy/MM/dd"
    df.locale = Locale(identifier: "ko_KR")
    return df
}()


var diaryList: [Date] = [customDateFormatter date(from: "2022년1월28일")]

var sortedList = diaryList.sorted(by: { $0 > $1 })

print(sortedList)


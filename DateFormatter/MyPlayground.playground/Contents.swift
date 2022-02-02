import UIKit

import Foundation

// Date 구조체 - 값 타입

// DateFormatter 클래스 - 참조타입


//date, dateformatter

let customDateFormatter = DateFormatter()
customDateFormatter.locale = Locale(identifier: "ko-KR") //나라마다 identifier를 설정해주어야함 기본값은 영국
customDateFormatter.dateFormat = "yyyy/MM/dd EEEE HH:mm" // y = year, M = month, d = day, E = 요일, a = 오전오후, h = 시간(12시), H = 시간(24시), m = 분

//let today = Date() //현재시간 default
//
//let strDate = customDateFormatter.string(from: today)
//customDateFormatter.date(from: strDate) //str->date타입으로 변경 date타입은 달력에 쓰인다.


//let customFormatter: DateFormatter = {
//    let df = DateFormatter()
//    df.locale = Locale(identifier: "ko-KR")
//    df.dateFormat = "yyyy/MM/dd EEEE HH:mm"
//    return df
//}()


//static

struct Person {
    var name: String //저장 프로퍼티 -> 값을 저장해야만 사용가능한 프로퍼티
    var age: Int
    
    static let gender: String = "male" //타입 프로퍼티
}

let james: Person = Person(name: "james", age: 40)

james.age
Person.gender

struct Memo {
    var content: String
    var date: Date = Date()
}

let memo1 = Memo(content: <#T##String#>)

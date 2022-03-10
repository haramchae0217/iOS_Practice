import Cocoa

// 열거형

//enum 열거형이름: 연관값의타입 {
//    case 케이스명1 = 연관값1
//    case 케이스명2 = 연관값2
//    case 케이스명3, 케이스명4 = 연간괎3
//}

// 과일

enum Fruits: Int {
    case apple = 1
    case banana = 2
    case kiwi = 3
    case mango
}

Fruits.apple.rawValue

enum Beverage {
    case coffee, tea, juice
}

let coffee: Beverage = .coffee

switch coffee {
case .coffee: print("coffee 입니다.")
case .tea: print("tea 입니다.")
case .juice: print("jucie 입니다")
    
}

//실습
enum School: String {
    case elementary = "8-13세"
    case middle = "14-16세"
    case high = "17-19세"
}

School.elementary.rawValue // 원시값에 접근하는 방법

// 함수 실습
// 인자로 School을 받아서 해당 학교의 연령대를 출력해주는 함수
// 출력 형태 : "elementary의 연령대는 8-13세 입니다."
// 함수명 : schoolAge

func schoolAge(school: School) -> String {
    var range: String = ""
    switch school {
    case .elementary: range = school.rawValue
    case .middle: range = school.rawValue
    case .high: range = school.rawValue
    }
    return "\(school)의 연령대는 \(range) 입니다."
}

schoolAge(school: .middle)

enum Operator: String {
    case plus = "+"
    case minus = "-"
    case multiply = "*"
    case divide = "/"
    case rem = "%"

}

// 숫자(Int) 2개, 연산자 1개
func calculator(num1: Int, num2: Int, op: Operator) -> String {
    var total: Int = 0
    switch op {
    case .plus: total = num1 + num2
    case .minus: total = num1 - num2
    case .multiply: total = num1 * num2
    case .divide: total = num1 / num2
    case .rem: total = num1 % num2
    }
    return "\(num1)\(op.rawValue)\(num2)=\(total)"
}

calculator(num1: 7, num2: 4, op: .divide)

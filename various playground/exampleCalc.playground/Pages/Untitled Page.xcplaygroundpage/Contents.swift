import Foundation
//
//func oneButton() -> Int {
//    return 1
//}
//
//func twoButton() -> Int {
//    return 2
//}
//
//func threeButton() -> Int {
//    return 3
//}
//
//func fourButton() -> Int {
//    return 4
//}
//
//func fiveButton() -> Int {
//    return 5
//}
//
//func formula() -> String {
//    let result = String(oneButton()) + String(twoButton()) + String(twoButton())
//    return result
//}

var formula = "12+34"

// isNumber
// isLetter

var array = formula.map{ String($0) } // ["11", "+", "22"]


var array2: [Character] = formula.map{ $0 }

var array3: [String] = []
//array2 = formula.isLetter()

var result: String = ""

for i in 0..<array2.count {
    if array2[i].isNumber == true {
        result += String(array2[i])
        if (array2.count - 1) == i {
            array3.append(result)
        }
    } else {
        array3.append(result)
        array3.append(String(array2[i]))
        result = ""
        
    }
    
}

print(array3)



//func plus (num1: String, num2: String) -> Double {
//        return Double(num1)! + Double(num2)! // 1 + 2
//
//}
//
//print(plus(num1:array[0], num2:array[2])) // 3

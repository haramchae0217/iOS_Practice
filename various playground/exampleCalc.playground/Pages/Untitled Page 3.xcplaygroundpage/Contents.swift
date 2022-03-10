//: [Previous](@previous)

import Foundation

// [ 문제 1 ]
// 문자열 s의 길이가 4 혹은 6이고, 숫자로만 구성되어 있는지 확인해주는 함수를 작성하세요. “a123”이면 false 를 리턴하고, “1231”라면 true 를 리턴합니다.
// ————————————————————————————————————————————
// func solution_1(s: String) -> Bool {
// // code
// return false }

func solution_1(s: String) -> Bool {
    var result = false
    
    if s.count == 4 || s.count == 6 {
        if (s.filter{ $0.isNumber }).count == 4 || (s.filter{ $0.isNumber }).count == 6 {
            result = true
        }
    } else {
        result = false
    }
    
    return result
}
solution_1(s: "a123")
solution_1(s: "1231")
 
// ————————————————————————————————————————————
// [ 문제 2 ]
// 자연수 N이 주어지면, N의 각 자릿수의 합을 구해서 리턴하는 함수를 작성하세요. ex. N=123 이면 1+2+3 = 6 을 리턴하면 됩니다.
// ————————————————————————————————————————————
// func solution_2(n: Int) -> Int {
// // code
// return 0 }
 
func solution_2(n: Int) -> Int {
    var answer: Int = 0
    let n = String(n)
    var numArray: [String] = []
    let array: [Character] = n.map { $0 }

    for i in 0..<array.count {
        if array[i].isNumber {
            numArray.append(String(array[i]))
        }
    }
    for j in 0..<numArray.count{
          answer += Int(numArray[j])!
       }
    return answer
}

// let array: [Int] = Array(0...n) 1~n까지의 배열 생성

func solution_4(n: Int) -> Int {
    let array: [String] = String(n).map { String($0) }
    return array.map{ Int($0)! }.reduce(0, +)
}

solution_2(n: 12345)
solution_4(n: 123)

// ————————————————————————————————————————————
// [ 문제 3 ]
// 핸드폰 번호는 010-0000-0000 의 형식으로 3자리, 4자리, 4자리로 이루어져있습니다. 여기서 가운데 4자리 숫자를 * 로 바꾸어주는 함수를 작성하세요.
// ex. 010-1234-5678을 입력하면 010-****-5678 을 리턴합니다.
// ————————————————————————————————————————————
// func solution_3(phoneNumber: String) -> String {
// // code
// return “” }

func solution_3(phoneNumber: String) -> String {

    var array: [String] = phoneNumber.components(separatedBy: "-")

    array[1] = "****"
    
    let protectPhoneNumber = ("\(array[0])" + "-" + "\(array[1])" + "-" + "\(array[2])")
    
    return protectPhoneNumber
}

solution_3(phoneNumber: "010-9151-6544")



/*
 } 4 <= array.count && array.count <= 7 {
     protectPhoneNumber += "*"
 } else {
     protectPhoneNumber += String(array[i])
 }
 */

//: [Previous](@previous)

import Foundation

// 문자와 숫자가 섞여있는 문자열을 입력받고
// charArray에는 문자만
// numArray에는 숫자만
// oddArray에는 홀수만
// evenArray에는 짝수만
// charString
// numString

let str = "12u5zx6b60s"

var charArray: [String] = []
var numArray: [String] = []
var oddArray: [String] = []
var evenArray: [String] = []
var charString = ""
var numString = ""

var array: [Character] = str.map { $0 }


for i in 0..<array.count {
    if array[i].isNumber {
        if Int(String(array[i]))! % 2 == 0 {
            numArray.append(String(array[i]))
            evenArray.append(String(array[i]))
        } else {
            numArray.append(String(array[i]))
            oddArray.append(String(array[i]))
        }
        numString += String(array[i])
    } else {
        charArray.append(String(array[i]))
        charString += String(array[i])
    }
}

print(charArray)
print(numArray)
print(oddArray)
print(evenArray)
print(charString)
print(numString)


//: [Next](@next)

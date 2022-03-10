////
////  main.swift
////  character
////
////  Created by Chae_Haram on 2021/12/14.
////
//
import Foundation
//
//var hello = "hello world"
//
//print(hello)
//
//print(hello.count) //아이디 열자 이하 이런 조건 정할때
//
//// for문에 c스타일과 swift스타일 두가지 방법 존재
//// c언어 -> 인덱스 접근
//// 문자에 대해서 이름 붘여주는 방식
///*
//for i in 0..<hello.count{
//    print(hello[i])
//}
//for char in hello{
//    print(hello)
//}
//*/
//
////hello.isEmpty // bool타입 빈 문자열을 참 거짓으로 나타낼 때
//// 회원 가입할때 비어있으면 안되는 창이 있을 때
//// 값이 있으면 False, 값이 없으면 True로 반환
////print(hello.isEmpty)
////
////hello.lowercased() // 소문자로 변환
////hello.uppercased() // 대문자로 변환
////
////hello.append() // 문자열 인덱스 추가
////hello.remove(at: <#T##String.Index#>) // 특정 문자열 인덱스에 접근해 지우고자 하는 값을 반환
////"1.2.3.4".replacingOccurrences(of: ".", with: "")
//
////hello.map{String($0)}
//// swift 고차함수
//// 형변환은 () 소괄호
//// map을 쓰면 문자열을 배열로 만들어줌
//// 앞 단어부터 $0으로 default값 마냥 설정해줌
//// hello.split(separator: Character) // -> subString 다른 배열로 반환해서 형변환이 추가로 필요
//print(hello.components(separatedBy: " ")) //-> 문자열 배열로 반환 따라서 더 많이 씀 //파이썬 split이랑 비슷함
//
////문자일때 안에 타입이 뭔지를 알 수 있음.
///*
// for char in hello{
//    Character(char).is
//}
//*/
//
//print("이름과 나이를 입력하세요")
//var input = readLine()! // 옵셔널 타입이라 ! 붙여줘야함
//                        // 옵셔널 값이 있을 수도 있고 없을 수도 있음.
//
//let information = input.components(separatedBy: " ")
//
//print(information[0],"님의 나이는 : ",information[1]) // 여러 원소 입력 시 자동 띄어쓰기 해줌
//print("\(information[0])님의 나이는 : \(information[1])")

// for문을 통해 숫자만 거르기

print("아무거나 입력하세요 : ")
var input = readLine()!
var numbers: [Character] = [] //배열 선언법

for char in input {
    if char.isNumber {
        print("숫자 -> \(char)")
        numbers.append(char)
    } else {
        print("문자 -> \(char)")
    }
}

if numbers.isEmpty {
    print("숫자가 없습니다.")
}

1 + 2 

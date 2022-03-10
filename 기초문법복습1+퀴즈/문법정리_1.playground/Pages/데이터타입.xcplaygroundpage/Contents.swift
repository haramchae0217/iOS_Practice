import UIKit

// MARK: - 0) 변수 상수 선언하기
/// : 초기값을 꼭 적지 않아도 된다. 하지만 초기값을 지정해주지 않은 상태로 해당 변수/상수에 접근 시 에러가 날 수 있음!
//let 상수명: 타입 = 초기값
//var 변수명: 타입 = 초기값


// MARK: - 1-1) 변수와 상수 차이
/// 변수와 상수는 값을 저장할 수 있는 공통점이 있지만, 상수는 한 번 저장된 값을 다른 값으로 변경할 수 없음.

// 상수
let myName: String = "kim"
//myName = "lee" // error

// 변수
var myName2: String = "park"
myName2 = "choi"

// MARK: - 1-2) 형변환
/// 자료형을 다른 타입의 자료형으로 변환하는 것
/// 자료형(타입을바꿀변수)
var number = 11 // 11
var stringNumber = String(number) // "11"

/// 형변환에 실패할 수도 있다. (ex. 문자는 숫자로 바꿀 수 없는데 바꾸려고 할 때)
var str = "안녕"
//var strToNumber = Int(str) // error

// MARK: - 1-3) 타입 추론
/// swift 언어의 가장 큰 특징은 "타입추론"이다. 누가봐도 타입이 명확한 경우 컴파일러가 자동으로 타입을 인식할 수 있기 때문에, 타입 선언을 생략할 수 있다!
var num1 = 4 // 타입 선언을 생략한 경우
var num2: Int = 4 // 타입을 선언한 경우

// 하지만, 추론의 결과가 내가 원하는 타입이 아닐 수도 있기 떄문에!
// 나는 실수타입으로 숫자를 사용하고 싶은데, 타입 추론을 해버리면 정수로 인식함. -> 이럴때는 명시적으로 타입을 써줄 것.
var num3: Float = 4 // 4.0

// MARK: - 2) 기본 자료형
// 기본 자료형에는 문자열(String), 정수(Int), 실수(Float, Double), 불타입(Bool) 이 있다.

// MARK: - 2-1) String
/*
 - 문자열을 저장하는 자료형
 - 큰 따옴표로 나타낸다.
 */
var email: String = "abc@gmail.com"

// MARK: - 2-2) Int
// 부호가 있는 정수 값을 저장하는 자료형
var intNumber: Int = 1000

// MARK: - 2-3) Float & Double
// 소수점이 포함된 실수 값을 저장하는 자료형
// Double은 Float 보다 더 넓ㅇ느 범위의 수, 더 많은 소수점 표현이 가능!
var floatNumber: Float = 4.6
var doubleNumber: Double = 15.3

// MARK: - 2-4) Bool
// true, false 두 종류의 값만 가질 수 있는 자료형
// 성공, 실패 등 이진 상태의 데이터에서 많이 사용. 조건문을 판단할 때도 사용
var flag: Bool = false
flag = true


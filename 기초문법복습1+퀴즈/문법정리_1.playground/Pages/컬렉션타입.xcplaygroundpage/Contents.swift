//: [Previous](@previous)

import Foundation

// MARK: - Array
// 같은 타입의 데이터들의 모임
// 순서가 있다.( 순서 = 인덱스 )
// 데이터의 수정, 삭제, 추가가 가능하다.
var weekdays: [String] = ["월", "화", "수", "목", "금", "토"] // 문자열 배열

// 배열의 값 접근
weekdays[0] // 월
weekdays[0...2] // ["월", "화", "수"]
weekdays[0..<2] // ["월", "화"]

// 값 추가
weekdays.append("일")

// 값 삽입
weekdays.append("공휴일")

// 값의 삭제
weekdays.remove(at: 2) // 2번쨰 인덱스에 있는 값 삭제
weekdays.removeFirst() // 배열의 0번째 원소 삭제
weekdays.removeLast() // 배열의 마지막 원소 삭제
weekdays.removeAll() // 전체 삭제


// MARK: - Set
// 같은 타입의 중복되지 않은 데이터들의 모임
// 순서가 없다.
// 데이터의 추가, 삭제가 가능하다.
// 배열과 선언 방식이 똑같으므로, Set 타입임을 명시해주지 않으면 배열로 타입 추론을 한다. 꼭 명시할 것.

// 선언 시 중복된 원소를 포함하여 선언하여도 결과물에는 중복된 원소가 없다.
let nums: Set = [1, 1, 1, 1, 2, 2]

var myNumbers: Set = [1, 2, 3, 5, 8, 9]
var yourNumbers: Set = [3, 4, 6, 7, 8, 9]

// 집합 연산
myNumbers.intersection(yourNumbers)
myNumbers.symmetricDifference(yourNumbers)
myNumbers.union(yourNumbers)
myNumbers.subtracting(yourNumbers)

// 값의 추가
myNumbers.insert(11)

// 값의 삭제
myNumbers.remove(1)

// 값 전체 삭제
myNumbers.removeAll()

// MARK: - Dictionary
// key, value가 하나의 연관된 쌍으로 된 데이터들의 모임
// 순서가 없다.
// 데이터의 수정, 삭제, 추가가 가능하다.
var attendentBook: [Int: String] = [ // key는 정수, value는 문자열인 딕셔너리
  0: "홍길동",
  1: "김철수",
  2: "김영희",
  3: "박진수"
]

// 딕셔너리 값 접근
attendentBook[1] // key값을 통해 접근

// 값의 추가
attendentBook[4] = "강감찬"
attendentBook

// 값의 수정
attendentBook.updateValue("정찬욱", forKey: 1)
attendentBook

// 값의 삭제
attendentBook.removeValue(forKey: 3)



//: [Next](@next)

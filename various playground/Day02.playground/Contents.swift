import Cocoa
import Darwin

/*
 Any - swift의 모든 타입을 지칭하는 키워드
 AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
 nil - 없음을 의미하는 키워드
 
 Array - 순서가 있는 리스트 컬렉션(인덱스)
 Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션
 
 Array option
 append - 인덱스 추가
 contains - 멤버를 가지고 있는지 bool값으로 반환
 remove(at : 0) - 0번 인덱스를 없애준다
 removeLast() - 마지막 인덱스 삭제
 removeAll() - 모든 인덱스 삭제
 count - 몇개의 인덱스로 이루어져있는지 확인 가능
 
 빈 Double Array 생성
 var doubles: Array<Double> = [Double]()
 
 빈 String Array 생성
 var strings: [String] = [String]()
 
 빈 Character Array 생성
 []는 새로운 빈 Array
 var characters: [Character] = []
 
 let을 사용하여 Array를 선언하면 불변 Array
 let은 상수라 변경 불가능
 let immutableArray = [1,2,3]
 
 Dictionary
 
 var anyDictionary: Dictionary<String, Any> = [String: Any]()
 anyDictionary["somekey"] = "value"
 anyDictionary["anotherKey"] = 100
 
 Dictionary 삭제
 anyDictionary.removeValue(forkey: "anotherKey")
 anyDictionary["someKey"]=nim
 
 Dictionary도 마찬가지로 let으로 받으면 값 변경 불가
 
 Set
 
 var integerSet: Set<Int> = Set<Int>()
 integerSet.insert(1)
 integerSet.insert(100)
 integerSet.insert(99)
 integerSet.insert(99)
 integerSet.insert(99)
 Set는 같은 수를 여러번 입력해도 하나만 지님
 
 integerSet.contains(1)
 integerSet.contains(2)
 contains를 사용해서 해당 값이 존재하는지 bool값으로 반환
 
 integerSet.remove(100)
 remove를 사용해 해당 값을 지울 수 있다.
 
 integerSet.count
 count를 통해 Set안에 몇개의 값이 존재하는지 알 수 있다.
 
 union - 합집합
 sortedUnion - 정렬
 intersection - 교집합
 subtracting - 차집합
 
 let setA: Set<Int> = [1,2,3,4,5]
 let setB: Set<Int> = [3,4,5,6,7]
 
 let union: Set<Int> = setA.union(setB)
 let sortedUnion: [Int] = union.sorted()
 let intersection: Set<Int> = setA.intersection(setB)
 let subtracting: Set<Int> = setA.subtracting(setB)
 
 */

// 배열
// 컬렉션 타입은 같은 자료형의 원소들로만 가능
// 아닐경우 Any를 넣지만 잘 사용하진 않는다.(명확한 값이 아니기 때문)

//let arr: Array<Int> // Object C
let arr: [Int] = [] // Swift

// 초기화, 메모리를 바로 할당하여 사용
let arr2:[Int] = []

// 인스턴스, 메모리를 평소에는 할당하지 않고 값이 들어갈때 메모리를 할당하기 시작
let arr3 = [Int]()

//초기화, 추가, 삭제, 업데이트
var arr4: [Int] = [1,2,3,4]
let arr5: [Int] = Array.init(repeating: 3, count: 5) // 3이 5개 있는 배열 [3,3,3,3,3]

// 추가
arr4.append(5)
// 삭제
//arr4.removeFirst() // 첫번째 값을 리턴, 인자를 입력하면 그 인자만큼 처음에서 떨어진 인덱스를 반환하고 삭제
//arr4.removeLast() // 마지막 값을 리턴, 인자를 입력하면 그 인자만큼 마지막에서 떨어진 인덱스를 반환하고 삭제
//arr4.remove(at: 0) // 기본적인 몇번째 인덱스를 지울지 선택하여 삭제
//arr4.removeAll() // 빈 배열로 만든다.
// 업데이트
arr4[2] = 3 // 2번 인덱스의 값을 3으로 변경
[1,2,3] + [4,5,6] // = [1,2,3,4,5,6]

//세트
// 같은 타입인 것들만 담을 수 있음
// 순서가 없고 중복된 원소가 없음.

var arr6: [Int] = [1,1,2,2,3,3,3]
Set(arr6)

// 추가
var set1: Set<Int> = [1,2,2,3,3,3,4,4,4,4]
set1.insert(6)
set1

// 삭제
// 순서를 특정할 수 없어서 전체삭제를 많이 사용함
set1.remove(2) // 특정 값을 지워줌, 값이 없을 수 있어서 optional 방식이다
set1.removeAll()

// 딕셔너리
// key와 value가 한 쌍으로 이루어짐
// key값을 통해 value을 이용할 수 있음.
var phoneNumber: [String: String] = ["홍길동": "010-0000-0000"]
phoneNumber["김철수"] = "010-1111-1111"

// 값 접근
phoneNumber["홍길동"]

// 업데이트
phoneNumber.updateValue("010-1234-1234", forKey: "홍길동")

// 삭제
phoneNumber.removeValue(forKey: "김철수")


// 배열은 순서가 있지만 세트랑 딕셔너리는 순서가 없음
// 배열 정렬
// sort
// 기본 값은 오름차순 정렬
// 원본도 바꿈
var numberArray: [Int] = [1,7,3,5,2]
//numberArray.sort()
//
//// sort(by:)
//numberArray.sort { lhs, rhs in
//    lhs>rhs
//}

// sorted
// 원본은 내둠
numberArray.sorted()

numberArray.sorted { lhs, rhs in
    lhs > rhs
}

// 함수 만드는 법
/*
 func 함수명(){
 // code
 }
 
 func 함수명(인자명: 인자타입){
 // code
 }
 
 func 함수명(인자명: 인자타입) -> 리턴타입 {
 // code
 return 리턴값
 }
 */

// hello 프린트하는 함수
func printHello() {
    print("hello")
}

printHello()

// 인자로 이름을 받아서 인사 문구를 출력해주는 함수
func printHello2(name: String){
    print("hello, \(name)")
}

printHello2(name: "홍길동")

// 이름을 인자로 받아서 인사문구를 리턴해주는 함수
func printHello3(name: String) -> String {
    return "hello, \(name)"
}

printHello3(name: "김철수")

let hi = printHello3(name: "김철수")
print(hi)

func getTotal(price: Int, howMany: Int) -> Int {
    return price * howMany
}

var infor = getTotal(price: 3000, howMany: 2)

func getAdvantage(price: Int, howMany: Int) -> Double{
    return Double(infor) * 0.1
}

func getAverage(name: String, kor: Int, mat: Int, eng: Int, sci: Int) -> String {
    let avg = Double(kor + mat + eng + sci) / 4
    return "\(name)의 평균은\(avg)점 입니다."
}
getAverage(name: "홍길동", kor: 80, mat: 75, eng: 70, sci: 70)

// 함수의 인자명을 생략(단, 인자에 무엇이 들어가는지 명확할 때 사용)
func printHello4(_ name: String){
    print(name)
}
printHello4("홍길동")

// _ 언더바 사용
// 1. 생략할 때 사용
// 2. for문에서 횟수에 대한 상수를 사용하지 않을 때 사용


import Cocoa

/*
 함수
 
 1. func 함수이름(매개변수1 이름: 매개변수1 타입, 매개변수2 이름: 매개변수2 타입 ...) -> 반환타입 {
    함수 구현부
    return 반환값
 }
 
 func sum(a: Int, b: Int) -> Int {
    return a+b
 }
 
 sum(a: 3, b: 5)
 
 2. func 함수이름(매개변수1 이름: 매개변수1 타입, 매개변수2 이름: 매개변수2 타입 ...) -> Void {
    함수 구현부
    return
 }
 
 func printMyName(name: String) -> Void {
    print(name)
 }
 
 printMyName(name: "yagom")
 
 Void : 생략가능, 반환값이 없다 이런 의미
 
 3. func 함수이름() -> 반환타입 {
    함수 구현부
    return 반환값
 }
 
 func maximumIntegerValue() -> Int {
    return Int.max
 }
 
 maximumIntegerValue()
 
 4. func 함수이름() -> Void {
    함수 구현부
    return
 }
 
 func hello() -> Void { print("hello") }
 
 hello()
 
 5. func 함수이름() {
    함수 구현부
    return
 }
 
 func bye() { print("bye") }
 
 bye()
 
 */

/*
 조건문
 
 스위프트의 조건에는 항상 Bool 타입이 들어와야한다.
 
 1. if - else
 
 if someInteger < 100 {
    print("100 미만")
 } else if someInteger > 100 {
    print("100 초과")
 } else{
    print("100")
 }
 
 2. switch
 
 switch someInteger{
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}
 
 break는 명시하지않아도 알아서 걸림.
 fallthrough를 사용해주면 다음 스위치 구문까지 내려감
 case값이 정확히 명시되지 않는다면. default값은 해주는게 좋다.
 
 */

/*
 반복문
 
 1. for - in
 
 var integers = [1,2,3]
 let people = ["jeong": 24, "kim":20, "lee":25]
 
 for integer in integers {
    print(integer)
 }
 
 for (name, age) in people {
    print("\(name): \(age)")
 }
 
 2. while
 
 while integers.count > 1 {
    integers.removeLast()
 }
 
 repeat {
    integers.removeLast()
 } while integers.count>0
 
 */

/*
 옵셔널 - 값이 있을수도, 없을수도 있음.
 nil의 가능성을 명시적으로 표현
 
 - nil 가능성을 문서화 하지 않아도 코드만으로 충분히 표현가능
    - 문서/주석 작성 시간을 절약
 - 전달받은 값이 옵셔널이 아니라면 nil 체크를 하지 않더라도 안심하고 사용
    - 효율적인 코딩
    - 예외 상황을 최소화하는 안전한 코딩
 
 enum + general (열거형 + 제너럴)
 
 enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
 }
 
 let optionalValue: Optional<Int> = nil
 let optionalValue: Int? = nil
 
 - ! 기호의 Optional
 Implicitly Unwrapped Optional - 암시적 추출 옵셔널
 
 var optionalValue: Int! = 100
 
 switch optionalValue {
 case .none:
    print("This Optional variable is nil")
 case .some(let value):
    print("Value is \(value)")
 }
 
 기존 변수처럼 사용 가능
 optionalValue = optionalValue + 1
 
 nil 할당 가능
 optionalValue = nil
 
 잘못된 접근으로 인한 런타임 오류 발생
 optionalValue = optionalValue + 1
 
 - ? 기호의 Optional
 var optionalValue: Int? = 100
 
 switch optionalValue {
 case .none:
    print("This Optional variable is nil")
 case .some(let value):
    print("Value is \(value)")
 }
int 값이 들어 있을 수도 있고 없을 수도 있다.
 
 nil 할당 가능
 optionalValue = nil
 
 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
 optionalValue = optionalValue + 1
 
 */

/*
 옵셔널 추출
 
 Optional Unwrapping
 
 1. Optional Binding
 옵셔널의 값을 꺼내오는 방법 중 하나
 nil 체크 + 안전한 값 추출
 
 if - let
 
 func printName(_ name: String) {
    print(name)
 }
 
 var myName: String! = nil
 
 if let name: String = myName {
    printName(name)
 } else {
    print("myName == nil")
 }
 
 name 상수는 if-let 구문 내에서만 사용가능합니다
 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
 printName(name)
 
 2. Force Unwrapping
 옵셔널의 값을 강제로 추출
 
 func printName(_ name: String) {
    print(name)
 }
 
 var myName: String? = "jeong"
 
 printName(myName!) // jeong
 
 myName = nil
 
 print(myName!)
 // 강제 추출 시 값이 없으므로 런타임 오류 발생
 
 var yourName: String! = nil
 
 printName(yourName)
 // nil 값이 전달되기 때문에 런타임 오류 발생
 
 */

// 반복문

let names: [String] = ["kate","kim","kris", "cate", "park","hong"]
let alphabet: String = "abcdefg"
// for in

//for name in names {
//    print(name)
//}
//
//for i in 0..<names.count{
//    print(names[i])
//}

// forEach
// 주로 문자열과 같이 쓰임
// 효율이 for in보다 조금 더 좋다

//for char in alphabet {
//    print(char)
//}
//
//alphabet.forEach { char in
//    print(char)
//}
//
//alphabet.forEach {
//    print($0)
//}

//names.forEach {
//    print($0)
//}

// while
// bool값으로 된 flag = flase
// false값이 true값으로 변하면 while문을 빠져나옴

//var bools: [Bool] = [false, false, false, false, true, false]
//var index: Int = 0
//var flag: Bool = false
//
//while flag == false {
//    if bools[index] == false {
//        index += 1
//        print("실패")
//    }else{
//        print("\(index)번만에 성공하셨습니다.")
//        flag = true
//    }
//}

// 조건문

for name in names{
    let arr = Array(name)
    let firstLetter: String = String(arr[0])
    
    if firstLetter == "k" {
        print(name)
    }
    
}

// 옵셔널
//let str: String = "a"
//let str2: String? = "a"
//
//str == str2
//type(of: str) == type(of: str2)

let number: String = "123"
let strToNum = Int(number)

// 옵셔널 바인딩

/*
 if let
 - 선언된 상수는 if문 안에서만 사용 가능
 - 상황에 따라 분기가 가능
 - 값이 존재한다는 조건만 맞으면 코드는 전부 실행
 
 guard
 - guard문이 포함된 중괄호 안에서 어디서든 사용 가능
 - 상황에 따라 분기가 불가능
 - 값이 존재하지 않으면, 그 아래에 있는 코드는 실행하지 않음
 */

// if - let
func check2(){
    print("if문 시작")
    if let num = Int(number){ // num의 값이 존재하면 괄호를 실행해줘
        print("num 존재")
        print("값 \(num)")
    } else { // num의 값이 존재하지 않으면 else 구문을 실행해줘
        print("num 없음")
    }
    
    print("if문 끝")
}
// guard 함수 안에서 사용가능
func check() {
    //guard let 상수명 = 옵셔널인 값 else { return 리턴해줄게 있으면 적는다 }
    print("함수 시작")
    guard let num = Int(number) else { return }
    print("값 \(num)")
    print("함수 끝")
    // let num = Int(number) 가 nil값이면 실행하지 않고 중간에 짤라준다
}

check()
check2()

//
//  main.swift
//  문법복습퀴즈_calculator
//

import Foundation

/*
 사용자로부터 정수를 입력을 받아 메뉴에 해당하는 기능을 실행할 수 있도록 할 것입니다.
 다음의 주어진 내용에 해당하는 코드 혹은 함수를 작성하고, 그것들을 합쳐서 사용자로부터 입력받아 계산을 하는 프로그램을 만들어보시오.
 
 1 > 다음의 메뉴를 출력하고, 사용자로부터 정수를 입력을 받습니다.
     (* HINT: readLine 사용)
 
 --------- 메뉴 --------
 1) 계산기
 2) inch -> cm 로 변환하기
 3) 종료
 ----------------------
 
 
 2-1 > 메뉴에서 1번을 입력받은 경우, "[ 1) 계산기 : 계산하고자하는 수식을 입력해주세요. ]" 를 출력합니다.
 
 
 2-2 > 연산기호와 숫자 2개를 받아 연산된 결과를 반환하는 함수를 작성하새요.
 - 연산은 다음 5가지만 가능합니다. 덧셈(+), 뺄셈(-), 곱셈(*), 나눗셈(/), 나머지연산(%)
 - 함수의 인자로 들어올 두 숫자는 정수만 받습니다.
 
 
 2-3 > 사용자로부터 입력을 받은 문자열을 바탕으로, 2-2번의 함수를 활용하여 연산 결과를 출력하세요.
     (* HINT: readLine을 연속으로 사용하면 연속하여 입력을 받을 수 있습니다.)
 - 수식은 아래와 같이 공백을 기준으로 숫자와 연산자를 구분합니다. ex) 11 + 32
 - 출력형태 : "= 43"
 
 3-1 > 메뉴에서 2번을 입력받은 경우, " 2) cm변환기 : 변환하고자하는 inch를 입력해주세요. ]"를 출력합니다.
 
 
 3-2 > inch수를 인자로 받아 cm값으로 변환한 결과를 반환하는 함수를 작성하세요.
 - 1inch = 2.54cm 입니다.
 - 인자와 반환값 보두 실수입니다.
 
 
 3-3 > 사용자로부터 입력을 받은 문자열을 바탕으로, 3-2번의 함수를 활용하여 연산 결과를 출력하세요.
 - 출력형태 : "0inch는 0.00cm 입니다."
 
 4 > 메뉴에서 3번을 입력받은 경우, "--프로그램을 종료합니다.--" 라는 문구를 출력해주고 더 이상 사용자로부터 입력을 받지 않도록 프로그램을 종료합니다.
 
 */

// 1
print("--------- 메뉴 --------")
print("1) 계산기")
print("2) inch -> cm 로 변환하기")
print("3) 종료")
print("선택할 메뉴 : ")
var input = readLine()!
let choice: Int = Int(input)!


// 2-1
if choice == 1 {
    print("[ 1) 계산기 : 계산하고자하는 수식을 입력해주세요. ]")
    let inputCalc = readLine()!
    let arrCalc: [String] = inputCalc.components(separatedBy: " ")
    let firstNumber: Int = Int(arrCalc[0])!
    let calcOp: String = String(arrCalc[1])
    let secondNumber: Int = Int(arrCalc[2])!
    
// 2-2
    func selfCalc(num1: Int, op: String, num2: Int) -> Int {
        var result = 0
        switch calcOp {
        case "+" : result = firstNumber + secondNumber
        case "-" : result = firstNumber - secondNumber
        case "*" : result = firstNumber * secondNumber
        case "/" : result = firstNumber / secondNumber
        case "%" : result = firstNumber % secondNumber
        default : print("올바른 연산자 입력이 아닙니다.")
        }
        return result
    }
// 2-3
    let total = selfCalc(num1: firstNumber, op: calcOp, num2: secondNumber)
    print("= \(total)")
// 3-1
} else if choice == 2 {
    print("[ 2) cm변환기 : 변환하고자하는 inch를 입력해주세요. ]")
    let inputInch = readLine()!
    let inchValue: Double = Double(inputInch)!
// 3-2
    func inchToCm(inch: Double) -> Double {
        return inch * 2.54
    }
    let cmValue = inchToCm(inch: inchValue)

// 3-3
    print("\(inchValue)inch는 \(round(cmValue * 100) / 100 )cm 입니다.")
// 4
} else if choice == 3 {
    print("--프로그램을 종료합니다.--")
    exit(0)
}


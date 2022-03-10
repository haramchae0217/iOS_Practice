//
//  main.swift
//  Quiz1
//
//  Created by Chae_Haram on 2021/12/20.
//

import Foundation

/*
 readLine() 은 xcode > macOS > commandLine Tool 로 만든 프로젝트에서만 사용 가능.
 플레이그라운드에서 불가하므로 프로젝트 하나 생성하서 해볼 것!
 */

/// 키보드 입력 받는 방법
var input = readLine()!

/// 1번
// 물건의 가격과 갯수를 입력값으로 받아 총 판매액 출력하는 프로그램을 작성하시오.
//var price: Int = 3000

//var arr1: [String] = input.components(separatedBy: " ")
//
//var count: Int = Int(arr1[0])!
//var price: Int = Int(arr1[1])!
//
//func calc(a: Int, b: Int) -> Int {
//    let total = a * b
//    return total
//}
//
//var total = calc(a: count, b: price)
//
//print(total)


/*--------------------------------------------------------------------------------------*/

/// 2번
/// inch로 된 제품의 크기를 입력받아 cm로 출력하는 프로그램. ( 1inch = 2.54cm )
 // 입력 - inch값을 입력하세요: 00

let inchValue: Double = Double(input)!

func inchToCm(inch: Double) -> Double {
    return inch * 2.54
}

let cmValue = inchToCm(inch: inchValue)

let roundValue = round(cmValue * 100 / 100) // 둘째자리까지 반올림
//round(cmValue * 1000 / 1000) // 셋째자리까지 반올림

print("\(inchValue)inch는 -> \(cmValue)cm")
print("\(inchValue)inch는 -> \(roundValue)cm")

// 소수점 올림 ceil
// 소수점 내림 floor
// 소수점 반올림 round

// 표준입력으로 풀이 - 출력형태 1 : 00cm


// 표준입력으로 풀이 - 출력형태 2 : 00inch -> 00cm

// 표준입력으로 풀이 - 간소화. ( cm라는 변수에 값을 담는 과정을 생략. )

// 함수형태로 풀이

// 함수형태 - 간소화 ( cm라는 변수에 값을 담는 과정을 생략. )




/// ** 추가 예제 - readLine()을 사용. 공백을 기준으로 두 가지 인자를 받아 곱셈 결과를 프린트 해보기.
var twoInput = readLine()!

// components라는 함수는 득정 인자를 기준으로 문자열을 쪼개줍니다.
// map은 고차함수 중 하나로, 배열의 인자를 내가 원하는 형태로 변환하는데 사용됩니다.





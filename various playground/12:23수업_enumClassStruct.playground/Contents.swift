import UIKit
import Foundation

// enum

enum Fruits {
  case apple
  case banana
  case mango
  case watermelon
}

Fruits.mango

// enum - 원시값
enum Number: Int {
  case one = 1
  case two = 2
  case three = 3
}

Number.one.rawValue

// 실습 - switch 연계.
enum Direction {
  case east
  case west
  case south
  case north
}

//let dir: String = "north"
let myDirection: Direction = Direction.east

switch myDirection {
case .east:
  print("나는 동쪽을 바라보고 있습니다.")
case .west:
  print("니는 서쪽을 바라보고 있습니다.")
case .south:
  print("나는 남쪽을 바라보고 있습니다.")
case .north:
  print("나는 북쪽을 바라보고 있습니다.")
}

// 실습 - 학교
enum School: String {
  case elementary = "8-13세"
  case middle = "14-16세"
  case high = "17-19세"
}

School.high.rawValue

// 함수만들기
func ageRange(school: School) -> String {
  var schoolName: String = ""
  
  switch school {
  case .elementary:
    schoolName = "초등학교"
//    return "초등학교의 연령대는 \(school.rawValue) 입니다."
  case .middle:
    schoolName = "중학교"
  case .high:
    schoolName = "고등학교"
  }
  return "\(schoolName)의 연령대는 \(school.rawValue)입니다."
}

let mySchool: School = School.elementary
ageRange(school: mySchool)

// 계산기.. 사칙연산만!
enum Calculator {
  case plus
  case minus
  case multiply
  case divide
}

// lhs = left hand side
// rhs = right hand side

func calculator(lhs: Double, rhs: Double, op: Calculator) -> Double {
  switch op {
  case .plus:
    return lhs + rhs
  case .minus:
    return lhs - rhs
  case .multiply:
    return lhs * rhs
  case .divide:
    return lhs / rhs
  }
}

calculator(lhs: 2, rhs: 3, op: .divide)

// class & struct 퀴즈
/*
 다음과 같은 프라퍼티와 초기값을 가지는 원, 사각형 클래스를 각각 정의하고,
 인스턴스를 생성한 후
 어떤 도형의 면적이 가장 큰 지 판별하는 함수를 작성하세요.
 */

/*
 원: 중심점(10,10), 반지름 5
 사각형: 최소점(5,5), 최대점(10,10)
 
 함수의 출력결과
 원의 넓이: 000
 사각형의 넓이: 000
 0000이 더 넓습니다.
 */

// 클래스 선언
class Circle {
//  var centerX: Int
//  var centreY: Int
  var center: (Int, Int)
  var radius: Double
  var area: Double {
    return radius * radius * 3.14
  }
  
  init(center: (Int, Int),
       radius: Double) {
    self.center = center
    self.radius = radius
  }
}

// 인스턴스
Circle.init(center: (10, 10), radius: 5)
let circleInstance = Circle(center: (10, 10), radius: 5)
circleInstance.area



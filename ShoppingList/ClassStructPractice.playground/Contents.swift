import UIKit

// 학생 클래스
// -> 이름String, 성별String, 학년Int

class Student {
    var name: String
    var gender: String
    var grade: Int
    
    init (name: String, gender: String, grade: Int) {
        self.name = name
        self.gender = gender
        self.grade = grade
    }
}

/*
 kate, female, 1
 brian, male, 2
 jin, male, 2
*/

//var kate = Student(name: "kate", gender: "female", grade: 1)
//var brian = Student(name: "brian", gender: "male", grade: 2)
//var jin = Student(name: "jin", gender: "male", grade: 2)

//let englishClass: [Student] = [kate, brian, jin]



//영어수업을 듣는 학생들의 이름 출력

for student in englishClass {
    if student.grade == 2 {
        print(student.name)
    }
}

let fruits: [String] = ["apple", "banana", "kiwi"]

//인덱스 접근
for i in 0..<fruits.count {
    print(fruits[i])
}

//인덱스 번째에 있는 애를 어떤 값으로 이름 붙여줌
for fruit in fruits {
    print(fruit)
}

import UIKit

struct SomeStructure {
    // structure deinition goes here
}

class SomeClass {
    // class definition goes here
}

// example of definition

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("The width of someResolution is \(someResolution.width)")

print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now\(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)

var cinema = hd

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")

print("hd is still \(hd.width) pixels wide")

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
/// === "동일", =="같음"
/// 동일하다는 것은 클래스 유형의 두 상수 또는 변수가 정확히 동일한 클래스 인스턴스를 참조한다는것을 의미. 단순히 값이 같다의 비교 연산자랑 다름

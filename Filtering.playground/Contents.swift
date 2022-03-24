import UIKit

// 문자열을 문자배열로 바꾸기
//let str: String = "문자열"
//var charArray: [String] = []
//
////for char in str {
////    charArray.append(String(char))
////}
//
////str.map { char in
////    charArray.append(String(char))
////}
//
//print(str.map{ $0 })
//
//print(charArray) // ["문","자","열"]

// 고차함수 : filter, map, reduce
/*
 for문과의 공통점 같이 처음부터 끝까지 원소들을 순회한다는 점.
 
 filter : 조건에 맞는 원소들을 걸러주는 역할 -> 따라서 조건문만 들어갈 수 있음.
 map : 우리가 원하는 형태로 변형시켜주는 역할.
 reduce : 특정 초기값에 연쇄적으로 연산을 해주는 것.
 */

let contactList: [String] = ["A","a","B","ab","도넛"]
let searchText: String = "a"
var filterName: [String] = contactList.filter { contact in
//    contact == searchText // 이러면 정확히 일치하는 이름만 걸러짐
    // 1. "둘리" -> ["둘","리"]
    contact.map { String($0) }.contains(searchText)
    // 2. ["둘" ,"리"] 에서 searchText를 포함하고 있는지 체크
    
}
print(filterName)

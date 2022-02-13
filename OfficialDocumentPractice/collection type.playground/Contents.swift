import UIKit

// --- 배열 ---
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList: [String] = ["Eggs", "Milk"]

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}

shoppingList.append("Flour")

shoppingList += ["Baking powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas","Apples"]

shoppingList.insert("Maple Syrup", at: 0)

let mapleSyrup = shoppingList.remove(at: 0)

firstItem = shoppingList[0]

let apples = shoppingList.removeLast()

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// --- 세트 ---
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")

letters = []

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]

print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funcky in here.")
}

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits).sorted() //합집합
oddDigits.intersection(evenDigits).sorted() //교집합
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // 차집합
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() //교집합의 여집합

// --- 사전 ---
var namesOfIntergers: [Int: String] = [:]

namesOfIntergers[16] = "sixteen"
namesOfIntergers = [:]

var airport1: [String: String] = ["YYZ": "Toronto Person", "DUB": "Dublin"]

var airport2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The airports dictionary contains \(airport1.count) items.")
if airport1.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}

airport1["LHR"] = "London"

airport1["LHR"] = "London Heathrow"

if let oldValue = airport1.updateValue("Dublin", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airport1["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}

airport1["APL"] = "Apple International"
airport1["APL"] = nil

if let removedValue = airport1.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}

for (airportCode, airportName) in airport1 {
    print("\(airportCode): \(airportName)")
}

for airportCode in airport1.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airport1.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airport1.keys)
let airportNames = [String](airport1.values)

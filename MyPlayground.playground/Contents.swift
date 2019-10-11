import UIKit

var str = "Hello, playground"
print(str)

var max = 20
max = 16

let score = 100
var studentScore = 0
studentScore = 40

let (a, b, c) = (10, 20, 30)
print(a+b+c)

var name: String = ""
var lastName: String = ""
var nickName = ""

name = "ABC"
lastName = "DEFG"

var fullName: String = ""
fullName = name + " " + lastName
print(fullName)

var points = [Int]()
points.append(20)
points.append(40)

var countries: [String] = []
countries.insert("America", at: 0)
countries.insert("Thailand", at: 1)
countries.sort()

var profile = [String: String]()
profile.updateValue("Tae", forKey: "name")
profile.updateValue("pp", forKey: "last")

print(profile["name"]! + " " + profile["last"]!)

profile.removeValue(forKey: "name")
print(profile["last"]!)

for country in countries {
    print(country)
}

for i in 0...countries.count-1 {
    print(countries[i])
}


let twoDimArray: [[Int]] = [[1,2,3], [4,5,6]]

var i = 0
while i < 10 {
    print(i)
    i += 1
}

var age = 10
if age >= 1 && age <= 12 {
    print("Child")
} else if age > 12 && age <= 22 {
    print("Adolescene")
} else if age > 22 && age <= 60 {
    print("Middleage")
} else {
    print("Elderly")
}

struct Person {
    var name: String
    var age: Int
    var address: String
}

var persons: [Person] = []
persons.append(Person(name: "John Dole", age: 25, address: ""))

var point = 50
switch point {
case 10:
    print("test")
default:
    print("default")
}

func foo() -> Void {
    print("bar")
}

foo()

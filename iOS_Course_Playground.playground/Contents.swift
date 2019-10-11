import UIKit

var str = "Hello, GLO"


// Constant And Variables

let maxStudents = 10
var currentStudent = 5

// maxStudents = 20
currentStudent = 10

print(maxStudents)
print(currentStudent)

// Assignment Operator

let b = 10
var a = 5

a = b

let (x,y,z) = (1,2,3)

var k = y

// Arithmetic Operators

var num_1 = 5.0
var num_2 = 9.5

print(num_1+num_2)
print(num_1-num_2)
print(num_1*num_2)
print(num_1/num_2)


// Arrays

var arrInt = [Int]()

print(arrInt)

// Dictionary

var namesOfIntegers = [Int:String]()

print(namesOfIntegers)

namesOfIntegers = [0:"Swift",1:"XCode"]

print(namesOfIntegers)
print(namesOfIntegers[0])
print(namesOfIntegers[0]!)

// Control flow

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    print("Hello, \(name)!")
}

for i in 0..<names.count {
     print("Hello2, \(names[i])!")
}

var i = 0

while i<names.count {
    print(names[i])
    i+=1
}


// Conditional Statements

var temperatureInFahrenheit = 40
// if
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

// switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet") 
default:
    print("Some other character")
}

// Functions

func sayHello() -> String {
    return "Hello Lottery"
}

let result = sayHello()
let _ = sayHello()
print(sayHello())

func sayHello2() {
    print("Hello Lottery2")
}

sayHello2()

func gradeReport(score :Int) -> String {
    var grade : String = ""
    
    if score >= 80 {
        grade = "A"
    }else if score >= 70 && score < 80 {
        grade = "B"
    }else if score >= 60 && score < 70 {
        grade = "C"
    }else if score >= 50 && score < 60 {
        grade = "D"
    }else if score < 50 {
        grade = "F"
    }
    
    return grade
}

let report = gradeReport(score: 66)
print(report)

func gradeReportWithName(name :String , score :Int) -> String {
    var grade : String = ""
    
    if score >= 80 {
        grade = "A"
    }else if score >= 70 && score < 80 {
        grade = "B"
    }else if score >= 60 && score < 70 {
        grade = "C"
    }else if score >= 50 && score < 60 {
        grade = "D"
    }else if score < 50 {
        grade = "F"
    }
    
    return name+" : Grade = "+grade
}

let report2 = gradeReportWithName(name: "Teravat", score: 88)
print(report2)

// Enum

enum Compass {
    case north
    case south
    case east
    case west
}

print(Compass.north)

// Struct And Class

struct CarPart {
    var wheel : [Int] = []
    var engine : String
    var body : String
    var glass : String
    var lamp : [Int] = []
}

class Car {
    var model : String = ""
    var car : CarPart
    
    init(model: String, car: CarPart) {
        self.model = model
        self.car = car
    }
}

let devCar : Car = Car(model: "SS99Xe", car: CarPart(wheel: [0,1,2,3], engine: "TurboX9", body: "White", glass: "3M", lamp: [0,1,2,3,4,5]))

print(devCar.car.engine)
print(devCar.model)

// Optional

var money : Int?

money = 10000

print(money)

money = nil
print(money)

var life : String!
print(life)

// Protocols

protocol Training {
    func tutor() -> String
}

class TrainingIOS : UIViewController {
    var delegate : Training?
    
}

class NameTutor : UIViewController {
    var train : TrainingIOS?
    func tutor() -> String {
        return "GLO TRAINING"
    }
}


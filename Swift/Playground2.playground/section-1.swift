// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var pi = 3.14159

var pi2 = 3.14159, other = 3

var level = 42

var list = ["pen", "paper"]

var list2: Array<String> = []

var dict = ["name":"Mark","age":39]
//^NSDictionary

var dict2 = ["foo": 12, "bar" : 14]

enum Sex {
    case Male, Female
}

let sex = Sex.Male
let sex2: Sex = .Female

enum Result {
    case Success(value: String)
    case Failure(errorCode: Int)
}

let result = Result.Success(value: "done!")
let result2 = Result.Failure(errorCode: 5)

let (x,y) = (5,6)



func sum(rhs: Int, lhs: Int) -> Int {
    return rhs + lhs
}

let calc = sum

calc(1,2)

let calc2 = {(rhs: Int, lhs: Int) -> Int in rhs + lhs}

calc2(3,4)

struct Person {

    var name: String
    var age: Int
    
    init (_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
    
    func foo() {
        println("Hi")
    }
    
}


let people = [
    Person("Mark", 39),
    Person("Z", 35),
    Person("K", 30),
    Person("N", 15),
]

var experience = 0
for person in people {
    experience += person.age
}

let totalexperience = people.reduce(0) {value, person in return value + person.age}

var action = Person.foo











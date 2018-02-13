//  HW_Objective-Oriented swift
//
//  Created by ChenAlan on 2018/2/12.
//
//  Remote Assignment - Week 2
/*
 ----------------
 Object-Oriented
 ----------------
 */

import Foundation

/*
 Q1: Declare a class
 */
enum Gender {
    case male
    case female
    case undefined
}

class Animal {
    // Not sure let or var
    let gender: Gender
    func eat() {
        print("I eat everything!")
    }
    
    init(gender: Gender) {
        self.gender = gender
    }
}

/*
 Q2: Class inheritance
 */
class Tiger: Animal {
    override func eat() {
        print("I eat meat!")
    }
}

class Horse: Animal {
    override func eat() {
        print("I eat carrots!")
    }
}

class Elephant: Animal {
    override func eat() {
        print("I eat plants!")
    }
}


/*
 Q3:
 */
class Zoo {
    var weeklyHot: Animal?
//    init(animal: Animal?) {
//        self.weeklyHot = animal
//    }
}

let zoo = Zoo()
let tiger = Tiger(gender: Gender.male)
let elephant = Elephant(gender: Gender.female)
let horse = Horse(gender: Gender.undefined)

zoo.weeklyHot = tiger
print(zoo.weeklyHot!)
zoo.weeklyHot = elephant
print(zoo.weeklyHot!)
zoo.weeklyHot = horse
print(zoo.weeklyHot!)

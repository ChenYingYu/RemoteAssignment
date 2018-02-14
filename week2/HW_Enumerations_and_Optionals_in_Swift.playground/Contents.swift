//  HW_Enumerations_and_Optionals_in_swift
//
//  Created by ChenAlan on 2018/2/13.
//
//  Remote Assignment - Week 2
/*
 ---------------------------
 Enumerations and Optionals
 ---------------------------
 */

import Foundation

/*
 Q1: Enum
 */
enum Gasoline {
    case unleaded92
    case unleaded95
    case unleaded98
    case diesel
    
    func getPrice() {
        switch self {
        case .unleaded92: 26.7
        case .unleaded95: 28.5
        case .unleaded98: 30.5
        case .diesel: 24.9
        }
    }
}


/*
 Q2: Optional
 */
class Pet {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class People {
    var pet: Pet?
}

// guard let
let person = People()
person.pet = Pet(name: "icecream")
func getNameOfPet() -> String? {
    guard let pet = person.pet else {
        return "Can not find a pet"
    }
    return pet.name
}
getNameOfPet()

// if let
let anotherPerson = People()
anotherPerson.pet = Pet(name: "Sakamoto")
if let pet = anotherPerson.pet {
    print(pet.name)
} else {
    print("Can not find a pet")
}

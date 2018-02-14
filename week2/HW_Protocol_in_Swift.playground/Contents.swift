//  HW_Protocol_in_Swift
//
//  Created by ChenAlan on 2018/2/14.
//
//  Remote Assignment - Week 2
/*
 ------------------
 Protocol in Swift
 ------------------
 */

import Foundation

// Q1: Declare a protocol
protocol PoliceMan {
    func arrestCriminals()
}

// Q3: Declare another protocol
protocol ToolMan {
    func fixComputer()
}

// Q2: Make a struct conform to a protocol
struct Person: PoliceMan {
    let name: String

    // Q4: Protocol as type
    let toolMan: ToolMan

    func arrestCriminals() {}
}

/*
 Q5: Declare a struct conform to another protocol
 */
struct Engineer: ToolMan {
    func fixComputer() {}
}

/*
 Q6: Implement protocols
 */
let engineer = Engineer()
let person = Person(name: "Steven", toolMan: engineer)


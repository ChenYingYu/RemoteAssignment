//  HW_Function
//
//  Created by ChenAlan on 2018/2/7.
//
//  Remote Assignment - Week 1
/*
 ------------------
 Function in Swift
 ------------------
 */

import Foundation

// 1. Declare a function

func greet(person: String) -> String {
    return "Hello, \(person)"
}

// 2. Default value of argument

func multiply(a: Int, b: Int = 10) {
    print(a * b)
}

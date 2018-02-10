//  HW_Swift_Basic.swift
//
//  Created by ChenAlan on 2018/2/5.
//
//  Remote Assignment - Week 1
/*
 -------------
 Swift Basic
 -------------
 */

import Foundation

/*
 Q1: Define a constant of type 'Double'
*/
let PI: Double = 3.14

/*
 Q2: Count the average of two integers
*/
let x: Int = 1
let y: Int = 2
// Divided by 2
let average = (x + y) / 2 // get 1 instead of 1.5

// Divided by 2.0
// let average = (x + y) / 2.0
// Error: Binary operator '/' cannot be applied to operands of type 'Int' and 'Double'

/*
 Q3: What if a record system only accept type 'Double' ?
*/
let newAverage = Double(average)

/*
 Q4: Mark the data type
*/
var flag: Bool = true
var inputString: String = "Hello world."
let bitsInBite: Int = 8
let averageScore: Double = 86.8

/*
 Q5: Compound Assignment
 */
var salary = 22000
salary += 28000

/*
 Q6: Equality operator
*/
// let checkIfEqual = 0 == false
// Error: Binary operator '==' cannot be applied to operands of type 'Int' and 'Bool'

/*
 Q7: Remainder
*/
let value = 10
let divisor = 3
let remain = value % divisor




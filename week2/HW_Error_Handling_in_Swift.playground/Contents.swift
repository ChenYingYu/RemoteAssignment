//  HW_Error_Handling_in_Swift
//
//  Created by ChenAlan on 2018/2/12.
//
//  Remote Assignment - Week 2
/*
 ------------------------
 Error Handling in Swift
 ------------------------
 */

import Foundation

class GuessNumerGame {
    var targetNumber = 10
    
    func guess(number: Int) throws {
        
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        
        print("Guess the right number:  \(targetNumber)")
    }
}

/*
 Q1: Solve the error
 */


/*
 Q2: Call guess(number:) and pass 20 as argument.
 */

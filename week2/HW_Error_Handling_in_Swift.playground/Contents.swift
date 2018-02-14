//  HW_Error_Handling_in_Swift
//
//  Created by ChenAlan on 2018/2/14.
//
//  Remote Assignment - Week 2
/*
 ------------------------
 Error Handling in Swift
 ------------------------
 */

// Sample code that contains an error
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
enum GuessNumberGameError: Error {
    case wrongNumber
}

/*
 Q2: Call guess(number:) and pass 20 as argument.
 */
do {
    try GuessNumerGame().guess(number: 20)
} catch GuessNumberGameError.wrongNumber {
    print(GuessNumberGameError.wrongNumber)
}


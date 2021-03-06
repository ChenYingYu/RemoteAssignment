//
//  Number.swift
//  終極密碼
//
//  Created by ChenAlan on 2018/2/26.
//  Copyright © 2018年 ChenAlan. All rights reserved.
//

import GameplayKit

class Number {
    var minValue: Int = 1
    var maxValue: Int = 100
    var guessNumber: Int = 0
    var secretNumber: Int = 0

    var randomNumber = GKRandomDistribution(lowestValue: 0, highestValue: 100)
    
    func newSecretNumber() {
        secretNumber = randomNumber.nextInt()
    }
    
    func reset() {
        minValue = 1
        maxValue = 100
        guessNumber = 0
        newSecretNumber()
    }
}



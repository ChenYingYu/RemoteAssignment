//
//  ViewController.swift
//  終極密碼
//
//  Created by ChenAlan on 2018/2/15.
//  Copyright © 2018年 ChenAlan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number = Number()
    var guessNumber = Number().guessNumber {
        didSet {
            updateGuessNumber()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newSecretNumber()
    }
    
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet var buttons: [UIButton]! {
        didSet {
            updateButtonStatus()
        }
    }
    
    @IBAction func numberButtons(_ sender: UIButton) {
        inputNumber(sender)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        guessNumber = 0
        updateGuessNumber()
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        checkAnswer()
        updateHintLabel()
        guessNumber = 0
        guessLabel.text = "請輸入數字"
    }
    
    func newSecretNumber() {
        number.secretNumber = number.randomNumber.nextInt()
    }
    
    func checkAnswer() {
        if guessNumber < number.minValue || guessNumber > number.maxValue {
            print("Unvalid Number: Please input a number between \(number.minValue) and \(number.maxValue)")
            return
        }
        
        let diff = guessNumber - number.secretNumber
        
        switch diff {
        case 1...: number.maxValue = guessNumber
        case 0:
            print("Well Done! You got the secret number!")
        case ..<0: number.minValue = guessNumber
        default:
            fatalError()
        }
    }
    
    func updateHintLabel() {
        hintLabel.text = "終極密碼 \(number.minValue) ~ \(number.maxValue)"
    }
    
    func inputNumber(_ button: UIButton) {
        if let titleNumber = button.title(for: UIControlState.normal), let input = Int(titleNumber) {
            guessNumber = guessNumber * 10 + input
        }
    }
    
    func updateGuessNumber() {
        guessLabel.text = "\(guessNumber)"
    }
    
    func updateButtonStatus() {
        for index in buttons.indices {
            let button = buttons[index]
            button.layer.borderWidth = 2.0
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.layer.cornerRadius = button.frame.size.height / 2
        }
    }
    
}


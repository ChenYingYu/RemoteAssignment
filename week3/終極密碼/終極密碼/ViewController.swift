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
            updateGuessLabel()
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
        updateGuessLabel()
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
            showInvalidMessage()
            return
        }
        
        let diff = guessNumber - number.secretNumber
        
        switch diff {
        case 1...: number.maxValue = guessNumber
        case 0:
            showCompleteMessage()
        case ..<0: number.minValue = guessNumber
        default:
            fatalError()
        }
    }
    
    func showInvalidMessage() {
        let alertController = UIAlertController(
            title: "無效數字",
            message: "輸入數字須介於 \(number.minValue) 到 \(number.maxValue) 之間",
            preferredStyle: .alert)
        
        let backAction = UIAlertAction(
            title: "好的",
            style: .default,
            handler: {
                (action: UIAlertAction!) -> Void in
        })
        alertController.addAction(backAction)
        
        self.present(
            alertController,
            animated: true,
            completion: nil)
    }
    
    func showCompleteMessage() {
        let alertController = UIAlertController(
            title: "恭喜！",
            message: "破解終極密碼：\(number.secretNumber)",
            preferredStyle: .alert)
        
        let newGameAction = UIAlertAction(
            title: "新遊戲",
            style: .default,
            handler: {
                (action: UIAlertAction!) -> Void in
                self.newGame()
        })
        alertController.addAction(newGameAction)
        
        self.present(
            alertController,
            animated: true,
            completion: nil)
    }
    
    func newGame() {
        number.minValue = 1
        number.maxValue = 100
        updateHintLabel()
        guessNumber = 0
        newSecretNumber()
        guessLabel.text = "請輸入數字"
    }
    
    func updateHintLabel() {
        hintLabel.text = "終極密碼 \(number.minValue) ~ \(number.maxValue)"
    }
    
    func inputNumber(_ button: UIButton) {
        if let titleNumber = button.title(for: UIControlState.normal), let input = Int(titleNumber) {
            guessNumber = guessNumber * 10 + input
        }
    }
    
    func updateGuessLabel() {
        guessLabel.text = "\(guessNumber)"
    }
    
    func updateButtonStatus() {
        for index in buttons.indices {
            let button = buttons[index]
            button.layer.borderWidth = 2.0
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.layer.cornerRadius = button.frame.size.width / 2
        }
    }
    
}


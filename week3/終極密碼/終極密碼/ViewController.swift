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
    
    @IBAction func holdDown(_ sender: UIButton) {
        sender.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: UIControlState.normal)
        sender.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        sender.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }
    
    @IBAction func numberButtons(_ sender: UIButton) {
        inputNumber(sender)
        updateButtonStatus()
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        guessNumber = 0
        updateGuessLabel()
        updateButtonStatus()
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        checkAnswer()
        updateHintLabel()
        guessNumber = 0
        guessLabel.text = "請輸入數字"
        updateButtonStatus()
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
            button.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            button.layer.borderWidth = 2.0
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.layer.cornerRadius = button.frame.size.width / 2
        }
    }
    
}


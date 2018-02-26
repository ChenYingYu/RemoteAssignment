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


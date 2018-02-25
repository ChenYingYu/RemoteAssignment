//
//  ViewController.swift
//  終極密碼
//
//  Created by ChenAlan on 2018/2/15.
//  Copyright © 2018年 ChenAlan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet var buttons: [UIButton]! {
        didSet {
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in buttons.indices {
            let button = buttons[index]
            button.layer.borderWidth = 2.0
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.layer.cornerRadius = button.frame.size.height / 2
        }
    }
    
}


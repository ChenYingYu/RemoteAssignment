//
//  ViewController.swift
//  FunFacts
//
//  Created by ChenAlan on 2018/2/12.
//  Copyright © 2018年 ChenAlan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    @IBOutlet weak var assignmentLabel: UILabel!
    
    let factProvider = FactProvider()
    let colorProvider = BackgroundProvider()
    let textProvider = AssignmentTextProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        funFactLabel.text = factProvider.randomFact()
        assignmentLabel.text = textProvider.randomText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showFact() {
        funFactLabel.text = factProvider.randomFact()
        assignmentLabel.text = textProvider.randomText()
        let randomColor = colorProvider.randomColor()
        view.backgroundColor = randomColor
        funFactButton.tintColor = randomColor
    }
    
}


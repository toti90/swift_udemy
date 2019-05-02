//
//  ViewController.swift
//  Dicee
//
//  Created by Tamás Tóth on 2019. 05. 01..
//  Copyright © 2019. Tamás Tóth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollButtonPresses(_ sender: UIButton) {
        
        rollDice(diceImage: diceImageView1)
        rollDice(diceImage: diceImageView2)
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype , with event: UIEvent?) {
        
        if motion == .motionShake {
            rollDice(diceImage: diceImageView1)
            rollDice(diceImage: diceImageView2)
        }
        
        
        
    }
    
    func rollDice(diceImage:UIImageView) {
        diceImage.image = UIImage(named: "dice\(Int.random(in: 1...6))")
    }
}


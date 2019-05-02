//
//  ViewController.swift
//  EightBallGame
//
//  Created by Tamás Tóth on 2019. 05. 02..
//  Copyright © 2019. Tamás Tóth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askButton(_ sender: Any) {
        
        rollDice(ballImage)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice(ballImage)
    }
    
    func rollDice(_ imageBall:UIImageView) {
        
        let random: Int = Int.random(in: 1...5)
        
        imageBall.image = UIImage(named: "ball\(random)")
        
    }
    
}


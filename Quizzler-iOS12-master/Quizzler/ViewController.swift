//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var allQuestions = QuestionBank()
    var numberOfQuestion:Int = 0
    var score:Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            checkAnswer(true)
        } else if sender.tag == 2 {
            checkAnswer(false)
        }
        
        
        if numberOfQuestion < allQuestions.list.count-1 {
            numberOfQuestion += 1
            nextQuestion()
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(numberOfQuestion+1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(numberOfQuestion+1)
      
    }
    

    func nextQuestion() {
        questionLabel.text = allQuestions.list[numberOfQuestion].questionText
    }
    
    
    func checkAnswer(_ answer:Bool) {
        let correctAnswer = allQuestions.list[numberOfQuestion].answer
        if answer == correctAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        } else {
            ProgressHUD.showError("Wrong")
        }
        
    }
    
    
    func startOver() {
        numberOfQuestion = 0
        score = 0
        nextQuestion()
        updateUI()
    }
    

    
}

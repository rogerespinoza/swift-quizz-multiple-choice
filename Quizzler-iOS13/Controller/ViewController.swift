//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1Label: UIButton!
    @IBOutlet weak var option2Label: UIButton!
    @IBOutlet weak var option3Label: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.setTitleColor(UIColor.green, for: .normal)
        }else{
            sender.setTitleColor(UIColor.red, for: .normal)
        }
        
        quizBrain.nestQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        let questionData = quizBrain.getQuestionData()
        
        questionLabel.text = questionData.text
        
        option1Label.setTitle(questionData.answer[0], for: .normal)
        option2Label.setTitle(questionData.answer[1], for: .normal)
        option3Label.setTitle(questionData.answer[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        option1Label.setTitleColor(UIColor.white, for: .normal)
        option2Label.setTitleColor(UIColor.white, for: .normal)
        option3Label.setTitleColor(UIColor.white, for: .normal)
    }
    
}


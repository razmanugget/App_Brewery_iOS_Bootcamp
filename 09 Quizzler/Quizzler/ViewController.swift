//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let allQuestions = QuestionBank()
  var pickedAnswer: Bool = false
  var questionNumber = 0
  var score = 0
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet var progressBar: UIView!
  @IBOutlet weak var progressLabel: UILabel!
  
  
  @IBAction func answerPressed(_ sender: AnyObject) {
    if sender.tag == 1 {
      pickedAnswer = true
    } else if sender.tag == 2 {
      pickedAnswer = false
    }
    
    checkAnswer()
    questionNumber += 1
    
    updateUI()
    nextQuestion()
  }
  
  
  func updateUI() {
    scoreLabel.text = "Score: \(score)"
    progressLabel.text = "\(questionNumber+1) / \(allQuestions.list.count)"
    
    progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
  }
  
  
  func nextQuestion() {
    // check for last
    if questionNumber < allQuestions.list.count-1 {
      questionLabel.text = allQuestions.list[questionNumber].questionText
    } else {
      let alert = UIAlertController(title: "Awesome!", message: "You finished all the questions, do you want to start over?", preferredStyle: .alert)
      let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
        self.startOver()
      }
      alert.addAction(restartAction)
      present(alert, animated: true, completion: nil)
    }
  }
  
  
  func checkAnswer() {
    let correctAnswer = allQuestions.list[questionNumber].answer
    
    if correctAnswer == pickedAnswer {
      ProgressHUD.showSuccess("Correct!")
      score += 1
    } else {
      ProgressHUD.showError("Wrong!")
    }
  }
  
  
  func startOver() {
    questionNumber = 0
    score = 0
    updateUI()
    nextQuestion()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
    nextQuestion()
  }
  
}

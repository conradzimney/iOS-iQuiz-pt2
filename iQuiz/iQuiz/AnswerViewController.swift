//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/9/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("\(questionNumber)")
        self.navigationItem.setHidesBackButton(true, animated: false)
        questionLabel.text = question
        yourAnswerLabel.text = "Your answer: \(chosenAnswer)"
        correctAnswerLabel.text = "Correct answer: \(correctAnswer)"
        if correctAnswer == chosenAnswer {
            correctnessLabel.text = "Correct!"
            numCorrect++
        } else {
            correctnessLabel.text = "Incorrect..."
        }
        if questionNumber == 3 {
            done = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var questions = [String]()
    var answers = [Array<String>()]
    
    var done = false
    var chosenAnswer = ""
    var correctAnswer = ""
    var question = ""
    var questionNumber = 0
    var numCorrect = 0

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    @IBOutlet weak var yourAnswerLabel: UILabel!
    
    @IBOutlet weak var correctnessLabel: UILabel!

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if !done {
            if segue.identifier == "ShowQuestionSegue" {
                if let destinationVC = segue.destinationViewController as? QuestionViewController {
                    destinationVC.questionNumber = questionNumber + 1
                    destinationVC.questions = questions
                    destinationVC.answers = answers
                    destinationVC.numCorrect = numCorrect
                }
            }
        }
    }
    
    @IBAction func goToNextQuestion(sender: UIButton) {
        if done {
            var vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("FinishedViewController")
            //vc.numCorrect = numCorrect
            self.showViewController(vc as! UIViewController, sender: vc)
        }
    }

}

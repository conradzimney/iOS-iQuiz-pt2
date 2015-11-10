//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/9/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

/*
struct Question {
    var question : String
    var answer : String
}
*/

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var questions = [String]()
    var answers = [Array<String>()]
    
    @IBOutlet weak var quizTitle: UINavigationItem!
    @IBOutlet weak var questionTableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var questionNumber = 0
    var numCorrect = 0
    var subject = ""
    let cellTableIdentifier = "cell"
    var selectedAnswer = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.questionTableView.delegate = self
        self.questionTableView.dataSource = self
        quizTitle.title = "\(subject) Quiz"
        questionLabel.text = questions[questionNumber]
        NSLog(questions.description)
        //NSLog(answers.description)
        NSLog("\(questionNumber)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //NSLog("I was clicked! and the subject is \(selectedSubject)")
        if segue.identifier == "ShowAnswerSegue" {
            if let destinationVC = segue.destinationViewController as? AnswerViewController {
                destinationVC.chosenAnswer = selectedAnswer
                destinationVC.correctAnswer = answers[questionNumber][questionNumber]
                destinationVC.question = questions[questionNumber]
                destinationVC.questionNumber = questionNumber
                destinationVC.questions = questions
                destinationVC.answers = answers
                destinationVC.numCorrect = numCorrect
            }
        }
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return 4
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)!
        selectedAnswer = (currentCell.textLabel?.text)!
        //NSLog(selectedAnswer)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = answers[questionNumber][indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

}

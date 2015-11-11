//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/9/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

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
        /*
        if questionNumber == questions.count {
            self.dismissViewControllerAnimated(false, completion: nil)
            var fVC : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("FinishedViewController")
            //self.storyboard!.instantiateViewControllerWithIdentifier("FinishedViewController") as FinishedViewController.numCorrect = numCorrect
            //fVC.numCorrect = numCorrect
            self.presentViewController(fVC as! UIViewController, animated: false, completion: nil)
            return
        }
        */
        self.questionTableView.delegate = self
        self.questionTableView.dataSource = self
        quizTitle.title = "\(subject) Quiz"
        questionLabel.text = questions[questionNumber]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
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

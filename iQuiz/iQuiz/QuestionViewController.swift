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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //NSLog("I was clicked! and the subject is \(selectedSubject)")
        if segue.identifier == "ShowAnswerSegue" {
            if let destinationVC = segue.destinationViewController as? AnswerViewController {
                destinationVC.answer = selectedAnswer
            }
        }
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return answers.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)!
        selectedAnswer = (currentCell.textLabel?.text)!
        NSLog(selectedAnswer)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath)
        
        let rowData = answers[indexPath.row]
        cell.textLabel?.text = rowData[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

}

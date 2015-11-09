//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/9/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

struct Question {
    var question : String
    var answer : String
}


class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let mathQuestions = ["What is 2 + 2?","What is 45 / 9?","What is 9 * 11?", "What is 55-35?"]
    let mathAnswers = [
        ["4","5","99","20"],
        ["4","5","99","20"],
        ["4","5","99","20"],
        ["4","5","99","20"]
    ]
    
    //@IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var questionTableView: UITableView!
    var subject = ""
    let cellTableIdentifier = "cell"
    var selectedAnswer = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.questionTableView.delegate = self
        self.questionTableView.dataSource = self
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
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return mathAnswers.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)!
        selectedAnswer = (currentCell.textLabel?.text)!
        NSLog(selectedAnswer)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath)
        
        let rowData = mathAnswers[indexPath.row]
        cell.textLabel?.text = rowData[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

}

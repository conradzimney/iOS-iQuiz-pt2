//
//  QuestionController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/8/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class QuestionController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let mathQuestions = ["What is 2 + 2?","What is 45 / 9?","What is 9 * 11?", "What is 55-35?"]
    let mathAnswers = [
        ["4","5","99","20"],
        ["4","5","99","20"],
        ["4","5","99","20"],
        ["4","5","99","20"]
    ]
    
    var subject = ""
    let cellTableIdentifier = "CellTableIdentifier"
    var selectedAnswer = ""
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
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
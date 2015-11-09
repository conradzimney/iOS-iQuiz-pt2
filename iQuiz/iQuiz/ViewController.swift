//
//  ViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/1/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let topics = [
        ["Subject" : "Mathematics", "Description" : "Mathematics Quiz!"],
        ["Subject" : "Marvel Super Heroes", "Description" : "Marvel Super Heroes Quiz!"],
        ["Subject" : "Science", "Description" : "Science Quiz!"]
    ]
    
    let mathQuestions = ["What is 2 + 2?","What is 45 / 9?","What is 9 * 11?", "What is 55-35?"]
    let mathAnswers = [
        ["4","5","99","20"],
        ["4","5","99","20"],
        ["4","5","99","20"],
        ["4","5","99","20"]
    ]
    let heroQuestions = ["Who wears a blue 'S' on their chest?","Who is a nocturnal flying mammal hero?","Who is the arachnid hero?","Who is the big green hero?"]
    let heroAnswers = [
        ["Superman","Batman","Spiderman","The Incredible Hulk"],
        ["Superman","Batman","Spiderman","The Incredible Hulk"],
        ["Superman","Batman","Spiderman","The Incredible Hulk"],
        ["Superman","Batman","Spiderman","The Incredible Hulk"]
    ]
    let scienceQuestions = ["What is the element with Atomic Name 'C'?","What is the element with Atomic Number 1?","What is an element with a different number of neutrons than normal called?","What is the Atomic Number of Helium?"]
    let scienceAnswers = [
        ["Carbon","Hydrogen","Isotope","2"],
        ["Carbon","Hydrogen","Isotope","2"],
        ["Carbon","Hydrogen","Isotope","2"],
        ["Carbon","Hydrogen","Isotope","2"]
    ]
    
    var selectedSubject = ""
    
    let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(QuizCell.self, forCellReuseIdentifier: cellTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsClicked(sender: AnyObject) {
        let message = "Settings will go here!"
        let controller = UIAlertController(title: "Settings",
            message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK",
            style: .Default, handler: nil)
        controller.addAction(action)
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func takeThisQuiz(sender: AnyObject) {
        NSLog("I was clicked!")
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as! QuizCell
        selectedSubject = currentCell.subject
        NSLog(currentCell.subject)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowQuestionSegue" {
            if let destinationVC = segue.destinationViewController as? QuestionController {
                destinationVC.subject = selectedSubject
            }
        }
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return topics.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath) as! QuizCell
        
        let imageView = UIImageView(frame: CGRectMake(10, 10, 5, 5))
        let image = UIImage(named: "quiz")
        imageView.image = image
        cell.imageView?.image = image
        let rowData = topics[indexPath.row]
        cell.subject = rowData["Subject"]!
        cell.desc = rowData["Description"]!
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

}


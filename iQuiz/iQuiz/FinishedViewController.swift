//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Conrad Zimney on 11/9/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    var numCorrect = 0
    var total = 4
    var gradeDescription = ""
    var grade = ""
    
    @IBOutlet weak var gradeDescLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    /*@IBAction func finishBUtton(sender: AnyObject) {
        // Don't need to do anything here
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch numCorrect {
        case 4:
            gradeDescription = "Perfect!"
            grade = "You got \(numCorrect) out of \(total) correct."
        case 3:
            gradeDescription = "Not bad!"
            grade = "You got \(numCorrect) out of \(total) correct."
        case 2:
            gradeDescription = "50% is still an F..."
            grade = "You got \(numCorrect) out of \(total) correct."
        case 1:
            gradeDescription = "Not very good."
            grade = "You got \(numCorrect) out of \(total) correct."
        default:
            gradeDescription = "You need some serious improvement..."
            grade = "You got \(numCorrect) out of \(total) correct."
        }
        gradeDescLabel.text = gradeDescription
        gradeLabel.text = grade
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

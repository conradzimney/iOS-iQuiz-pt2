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
    
    @IBOutlet weak var gradeDescLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    /*@IBAction func finishBUtton(sender: AnyObject) {
        // Don't need to do anything here
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch numCorrect {
        case 4:
            gradeDescLabel.text = "Perfect!"
            gradeLabel.text = "You got \(numCorrect) out of \(total) correct."
        case 3:
            gradeDescLabel.text = "Not bad!"
            gradeLabel.text = "You got \(numCorrect) out of \(total) correct."
        case 2:
            gradeDescLabel.text = "50% is still an F"
            gradeLabel.text = "You got \(numCorrect) out of \(total) correct."
        case 1:
            gradeDescLabel.text = "Not very good."
            gradeLabel.text = "You got \(numCorrect) out of \(total) correct."
        default:
            gradeDescLabel.text = "You need some serious improvement..."
            gradeLabel.text = "You got \(numCorrect) out of \(total) correct."
        }
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

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
        gradeDescLabel?.text = gradeDescription
        gradeLabel?.text = grade
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

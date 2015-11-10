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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var answer = ""

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    @IBOutlet weak var yourAnswerLabel: UILabel!
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func goToNextQuestion(sender: UIButton) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }

}

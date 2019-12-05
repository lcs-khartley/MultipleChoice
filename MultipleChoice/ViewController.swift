//
//  ViewController.swift
//  MultipleChoice
//
//  Created by Hartley, Keira on 2019-12-03.
//  Copyright © 2019 Hartley, Keira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var inputQuestionNumber: UITextField!
    
    @IBOutlet weak var inputStudentAnswers: UITextField!
    
    @IBOutlet weak var inputCorrectAnswers: UITextField!
    
    @IBOutlet weak var textOutput: UITextView!
    
    //MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Code that runs after the 'check answers' button is pressed
    @IBAction func buttonCheck(_ sender: Any) {
        //reset the output to be empty
        textOutput.text = ""
        
        // Variable that will be changed to count the number of correct answers
        var numberCorrect = 0
        
        //Guards against no input and turns the question number into an integer
        guard let questionsNumber = inputQuestionNumber.text, questionsNumber.count > 0, let numberOfQuestions = Int(questionsNumber) else {
            textOutput.text = "Please enter a value greater than 0."
            return
        }
        //Guards against no input and invalid number of answers inputed
        guard let studentAnswers = inputStudentAnswers.text, studentAnswers.count == numberOfQuestions else {
            textOutput.text = "Insure you have inputed \(numberOfQuestions) student answers."
            return
        }
        //Guards against no input and invalid number of answers inputed
        guard let correctAnswers = inputCorrectAnswers.text, correctAnswers.count == numberOfQuestions else {
            textOutput.text = "Insure you have inputed \(numberOfQuestions) correct answers."
            return
        }
        
        //Loop through the student answers to compare with the correct answer
        for (position, character) in correctAnswers.enumerated () {
            
            var index = studentAnswers.index(studentAnswers.startIndex, offsetBy: position)
            
            if character == studentAnswers[index] {
                numberCorrect += 1
            }
            
            
            
        }
        
        
        textOutput.text = "The student answered \(numberCorrect) question(s) correct."
        
    }
    
    
}






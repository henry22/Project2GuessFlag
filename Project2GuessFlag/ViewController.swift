//
//  ViewController.swift
//  Project2GuessFlag
//
//  Created by Henry on 5/1/15.
//  Copyright (c) 2015 Henry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    var countries = [String]()
    
    var correctAnswer = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // A borderWidth of 1, which will draw a one point black line around them
        firstButton.layer.borderWidth = 1
        secondButton.layer.borderWidth = 1
        thirdButton.layer.borderWidth = 1
        
        // We can't put a UIColor into the borderColor property because it belongs to a CALayer. So, we add .CGColor to the end of the UIColor to have it automagically converted to a CGColor.
        firstButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        secondButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        thirdButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction!) {
        
        countries.shuffle()
        
        //UIImage(named:) read from an array by position
        //firstbutton.setImage() assigns a UIImage to the button
        //forState: .Normal The setImage() method which state of the button should be changed?which means "the standard state of the button."
        //.Normal it understands that to mean "the Normal value of UIControlState."
        firstButton.setImage(UIImage(named: countries[0]), forState: UIControlState.Normal)
        secondButton.setImage(UIImage(named: countries[1]), forState: UIControlState.Normal)
        thirdButton.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        //To generate a random number between 0 and 2 inclusive, then convert it to an Int assign it to correctAnswer
        correctAnswer = Int(arc4random_uniform(3))
        //Read the string out from the countries array at the position of correctAnswer, then uppercase it
        title = countries[correctAnswer].uppercaseString
    }
    
    //Which button was tapped so we can judge whether the answer was correct
    @IBAction func buttonTapped(sender: UIButton) {
        var title:String
        if sender.tag == correctAnswer {
            title = "Correct"
            ++score
        }
        else {
            title = "Wrong"
            --score
        }
        //The title variable was set in our if statement to be either "correct" or "wrong", .Alert(UIAlertControllerStyle.Alert),which pops up a message box over the center of the screen
        let alertController = UIAlertController(title: title, message: "Score is \(score)", preferredStyle: .Alert)
        //The UIAlertAction data type to add a button to the alert that says "Continue", and gives it the style "Default"(UIAlertActionStyle.Default),the handler parameter is looking for a closure,but in our case we want the game to continue when the button is tapped, so we pass in askQuestion so that iOS will call our askQuestion() method
        alertController.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        //presentViewController(),which takes three parameters: a view controller to present, whether to animate the presentation, and another closure that should be executed when the presentation animation has finished
        presentViewController(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


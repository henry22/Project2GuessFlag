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
    
    func askQuestion() {
        
        countries.shuffle()
        
        //UIImage(named:) read from an array by position
        //firstbutton.setImage() assigns a UIImage to the button
        //forState: .Normal The setImage() method which state of the button should be changed?which means "the standard state of the button."
        //.Normal it understands that to mean "the Normal value of UIControlState."
        firstButton.setImage(UIImage(named: countries[0]), forState: UIControlState.Normal)
        secondButton.setImage(UIImage(named: countries[1]), forState: UIControlState.Normal)
        thirdButton.setImage(UIImage(named: countries[2]), forState: .Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


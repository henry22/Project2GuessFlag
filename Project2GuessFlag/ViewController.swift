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
        
        askQuestion()
    }
    
    func askQuestion() {
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


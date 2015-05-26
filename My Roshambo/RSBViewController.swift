//
//  RSBViewController.swift
//  My Roshambo
//
//  Created by Lupti on 5/25/15.
//  Copyright (c) 2015 lupti. All rights reserved.
//
//  Implement Scissors using pure Segue method,
//  Paper using Segue plus Code
//  Rock using programatical method

import UIKit

class RSBViewController: UIViewController {

    // Define button outlets
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    
    // Define getUserShape
    private func getUserShape(sender: UIButton) -> String {
        if sender == rockButton{
            return "Rock"
        }
        else if sender == paperButton{
            return "Paper"
        }
        else {
            return "Scissors"
        }
    }

    // First set up Segue with Identifier "rsb" to connect to Result View through Scissors trigger interface
    
    // Override prepareForSegue to connect to ResultView  via Identifier "rsb"
    // This prepareForSegue is required for both Paper and Scissors' Segue related methods
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "rsb" {
            let resultViewController = segue.destinationViewController as! ResultViewController
            resultViewController.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    // Next define IBAction for paper to call performSegueWithIdentifier
    // This is a Segue plus Code method. Here Segue Identifier is borrowed from Scissors' pure Segue method
    // which has the Identifier 
    // The performSegueWithIdentifier requires prepareForSegue define in order to know the destinationViewController
    // It uses segue.destinationViewController to transition to ResultViewController.
    
    @IBAction func playPaper(sender: UIButton) {
        performSegueWithIdentifier("rsb", sender: sender)
    }
    
    // Define playRock as programatic way, and declare private
    @IBAction private func playRock(sender: UIButton) {
        // Use UIViewController's instantiateViewControllerWithIdentifier to transition to ResultViewController
        // Important to register "resultView" to the ResultViewController's Identity Inspector under the "Storyboard" in order to make this instantiation work.
        // No Segue handle is used.
        // Next remember to call presentViewController
        
        let resultViewController = self.storyboard?.instantiateViewControllerWithIdentifier("resultView") as! ResultViewController
        
        resultViewController.userChoice = getUserShape(sender)
        
        presentViewController(resultViewController, animated: true, completion: nil)
    }

}


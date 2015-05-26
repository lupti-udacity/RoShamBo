//
//  ResultViewController.swift
//  My Roshambo
//
//  Created by Lupti on 5/25/15.
//  Copyright (c) 2015 lupti. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // Define variables that cannot have nil
    var userChoice: String!
    var opponentChoice: String!
    
    // Connect outlets set them to private
    
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultMessage: UILabel!
    
    @IBAction private func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    // New: viewWillAppear - a View lifecycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Use modulo 3 to randomlly selaect Rock, Paper or Scissors
        // define an array to hold all three possible outcomes
        let choices = ["Rock", "Paper", "Scissors"]
        let genRandomIndex = Int(arc4random() % 3)
         opponentChoice = choices[genRandomIndex]
        // Finally display the result through displayResult method to display
        // image, result message
        displayResult()
    }
    
    private func displayResult() {
        
        var imageName: String
        var text: String
        var opponentWon: Bool = false
        let matchup = "\(userChoice) vs. \(opponentChoice)"
        
        // First screen out the tie situation
        if userChoice == opponentChoice {
            resultImage.image = UIImage(named: "tie")
            resultMessage.text = "\(matchup): it's a tie!"
            return
        }
        
        // Otherwise, figure out if you won
        switch (userChoice) {
            
        case "Rock":
            opponentWon = opponentChoice == "Scissors"
            
        case "Paper":
            opponentWon = opponentChoice == "Rock"
            
        default: // scissors
            opponentWon = opponentChoice == "Paper"
        }
        
        // Create the text
        if opponentWon {
            text = "You Won! \(matchup)"
            imageName = "\(userChoice)-\(opponentChoice)".lowercaseString
        } else {
            text = "You Lost! \(matchup)"
            imageName = "\(opponentChoice)-\(userChoice)".lowercaseString
        }
        
        // Update the UI components
        resultImage.image = UIImage(named: imageName)
        resultMessage.text = text
    }


}

//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLeftBox: UIView!
    @IBOutlet weak var topRightBox: UIView!
    @IBOutlet weak var midLeftBox: UIView!
    @IBOutlet weak var midMidBox: UIView!
    @IBOutlet weak var midRightBox: UIView!
    @IBOutlet weak var bottomLeftBox: UIView!
    @IBOutlet weak var bottomRightBox: UIView!
    
    @IBOutlet weak var redBox: UILabel!
    @IBOutlet weak var orangeBox: UILabel!
    @IBOutlet weak var yellowBox: UILabel!
    @IBOutlet weak var greenBox: UILabel!
    @IBOutlet weak var blueBox: UILabel!
    @IBOutlet weak var purpleBox: UILabel!
    
    var rolls = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    hideViews()
        
        for i in 0..<6 {
            scoreLabelForIndex(i).hidden = true
        }
    }
    
    func hideViews() {
        
        topLeftBox.hidden = true
        topRightBox.hidden = true
        midRightBox.hidden = true
        midMidBox.hidden = true
        midLeftBox.hidden = true
        bottomRightBox.hidden = true
        bottomLeftBox.hidden = true
        
    }
    func hideLabels() {
        redBox.hidden = true
        orangeBox.hidden = true
        yellowBox.hidden = true
        greenBox.hidden = true
        blueBox.hidden = true
        purpleBox.hidden = true
    }
    
    @IBAction func dieButton(sender: AnyObject) {
        hideViews()
        let randomRollValue = randomDiceRoll()
        print(randomRollValue)
        showNumber(randomRollValue)
        dieRolls(randomRollValue)
        updateScoreLabel(randomRollValue)
    }
    
    func dieRolls(randomNumer: Int) { //This takes in the random die number and changes the appearance of the black boxes based on that number
        showNumber(randomNumer)
        rolls += 1
    }
    
    //This function sets one of the colored boxes as recepient of a new score
    private func scoreLabelForIndex(i: Int) -> UILabel {
        switch i {
        case 0: return purpleBox
        case 1: return redBox
        case 2: return orangeBox
        case 3: return yellowBox
        case 4: return greenBox
        case 5: return blueBox
        default: assert(false, "\(i) is faulty")
        }
    }
    
    func showNumber(randomRollValue: Int) {
        switch randomRollValue { //different views will be shown depening on which number is passed into this function.
            
        case 1: //If the random number is one, show the middle black box view
            midMidBox.hidden = false
            
        case 2: //If the random number is 2, shows two boxes
            topLeftBox.hidden = false
            bottomRightBox.hidden = false
            
        case 3:
            bottomLeftBox.hidden = false
            midMidBox.hidden = false
            topRightBox.hidden = false
            
        case 4:
            topRightBox.hidden = false
            topLeftBox.hidden = false
            bottomRightBox.hidden = false
            bottomLeftBox.hidden = false
            
        case 5:
            topRightBox.hidden = false
            topLeftBox.hidden = false
            bottomRightBox.hidden = false
            bottomLeftBox.hidden = false
            midMidBox.hidden = false
            
        case 6:
            topRightBox.hidden = false
            midRightBox.hidden = false
            bottomRightBox.hidden = false
            topLeftBox.hidden = false
            midLeftBox.hidden = false
            bottomLeftBox.hidden = false
        default: break
        }
    }
    
 //In this function, it take an argument of an Int (which will be the random die roll value) and then it updates the score label for one of the colored boxes. Because the boxes are indexed, they go through box by box with each die roll.
    private func updateScoreLabel(score: Int) {
        let scoreLabel = scoreLabelForIndex(rolls % 6) //This sets the box, it is using the universal variable "roll" to keep track.
        scoreLabel.text = "\(score)"//This changes of text of the specified box
        scoreLabel.hidden = false //This makes the box appear
    }
    
    
    // Returns back a random Int (1, 2, 3, 4, 5, or 6)
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
}

//
//  ViewController.swift
//  BullsEye
//
//  Created by Himanshu Rajput on 31/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var currentRound = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var currentRoundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
        
        let ThumbImageNormal = UIImage(systemName: "star.circle.fill")
        slider.setThumbImage(ThumbImageNormal, for: .normal)
        
        let ThumbImageHighlighted = UIImage(systemName: "flag.circle.fill")
        slider.setThumbImage(ThumbImageHighlighted, for: .highlighted)
        
        let edge = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(systemName: "line.horizontal.3.fill")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: edge)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(systemName: "line.horizontal.3.fill")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: edge)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        slider.tintColor = .yellow
        
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue) // Local
        var points = 100 - difference // Local
        score += points // Instance
        
        let title: String // Local
        if difference == 0 {
            points += 100
            title = "Perfect"
        } else if difference < 5 {
            if difference == 1{
                points += 50
            }
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "you scored \(points) points" // Local
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) // Local
        let action = UIAlertAction(title: "Awesome", style: .default, handler: { action in
            self.startNewRound()
        }) // Local
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func moveSlider(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func startNewGame() {
        score = 0
        currentRound = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentRound += 1
        targetValue = Int.random(in: 0...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = "\(score)"
        currentRoundLabel.text = "\(currentRound)"
    }
}


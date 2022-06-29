//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonSoft: UIButton!
    @IBOutlet weak var buttonMedium: UIButton!
    @IBOutlet weak var buttonHard: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var background: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var secondsRemaining = 60
    var neededTime: Float = 0
    var timer:  Timer? = nil
    var timerCompletitionInfo:  Timer? = nil
    
    enum Times: Int {
        case soft = 0
        case medium = 1
        case hard = 2 
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        self.timer?.invalidate()
        self.timerCompletitionInfo?.invalidate()
        self.progressBar.progress = 0
        
        guard let times = Times(rawValue: sender.tag) else {
            fatalError("Incorect button tag")
        }
        
        self.secondsRemaining = times.timeForButton()
        self.neededTime = Float(times.timeForButton())
        //print("Egg time: \(eggTime), name: \(times.name())")
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        //startTimer(timerToSet: self.timer, operation: updateCounter(), repeat: true)
    }
    
//    func startTimer(timerToSet: Timer?, operation: (), repeat: Bool) {
//        timerToSet = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(operation), userInfo: nil, repeats: repeat)
//    }
    
    @objc func updateCounter() {
                if self.secondsRemaining > 0 {
                    self.progressBar.progress = Float(self.secondsRemaining)  / self.neededTime
                    self.secondsRemaining -= 1
                } else {
                    self.timer?.invalidate()
                    self.progressBar.progress = 0
                    self.label.text = "Done!"
                    self.background.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                    
                    self.timerCompletitionInfo = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(informUserCompletision), userInfo: nil, repeats: false)
                }
            }
    
    @objc func informUserCompletision() {
        self.label.text = "How do you like your eggs?"
        self.progressBar.progress = 0
        self.background.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
}

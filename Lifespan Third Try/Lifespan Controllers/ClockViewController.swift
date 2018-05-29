//
//  ClockViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {
    
    @IBOutlet weak var hourKeyLabel: UILabel!
    @IBOutlet weak var minuteKeyLabel: UILabel!
    @IBOutlet weak var secondKeyLabel: UILabel!
    
    
    let minuteHandTag = 200
    let hourHandTag = 300
    let secondHandTag = 400
    
    let spentSegment = 0
    let remainingSegment = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func updateView() {
        
        let tb = self.tabBarController as! TabViewController
        tb.updateLife()
        
        guard let lifeSpan = tb.lifeSpan, let lifeClock = tb.lifeClock else {
            return
        }
        
        let tf = TextFormatter()
        
        let hourAttributedString = tf.createStringWithBoldPart(with: "One hour is ", and: "\(lifeSpan.yearsPerHour)", and: " years")
        hourKeyLabel.attributedText = hourAttributedString
        
        let minuetAttributedString = tf.createStringWithBoldPart(with: "One minuet is ", and: "\(lifeSpan.monthsPerMinutes)", and: " months")
        minuteKeyLabel.attributedText = minuetAttributedString
        
        let secondAttributedString = tf.createStringWithBoldPart(with: "One second is ", and: "\(lifeSpan.daysPerSeconds)", and: " days")
        secondKeyLabel.attributedText = secondAttributedString
        
        setClockView(with: lifeClock)
        
    }
            
    fileprivate func setClockView(with lifeClock: LifeClock) {
        let hourHand = view.viewWithTag(hourHandTag) as! HourHandView
        let minuteHand = view.viewWithTag(minuteHandTag) as! MinuteHandView
        let secondHand = view.viewWithTag(secondHandTag) as! SecondHandView

        hourHand.angle = lifeClock.hourHandAngle
        minuteHand.angle = lifeClock.minuteHandAngle
        secondHand.angle = lifeClock.secondHandAngle
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
}


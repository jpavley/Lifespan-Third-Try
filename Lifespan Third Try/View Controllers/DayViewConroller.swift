//
//  DayViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeSpanLabel: UILabel!
    @IBOutlet weak var agedLabel: UILabel!
    
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
        tb.updateLifeClock()
        
        guard let userProfile = tb.userProfile, let lifeSpan = tb.lifeSpan, let lifeClock = tb.lifeClock else {
            return
        }
        
        setClockView(with: lifeClock)
        
        userNameLabel.text = userProfile.name
        
        let birthYear = String(format: "%.0f", userProfile.birthYear.setting)
        let deathYear = String(format: "%.0f", CGFloat(userProfile.birthYear.setting) + lifeSpan.modifiedALE!)
        timeSpanLabel.text = "\(birthYear) to \(deathYear)"
        
        let age = String(format: "%.0f", lifeSpan.modifiedALE!)
        agedLabel.text = "Aged \(age)"
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


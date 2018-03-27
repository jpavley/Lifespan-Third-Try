//
//  DayViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class DayViewController: UIViewController, SharedState {
    
    var userProfile: UserProfile?
    var lifeSpan: Lifespan?
    var lifeClock: LifeClock?
    
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
        userProfile = UserProfile()
        updateView()
    }
    
    fileprivate func updateView() {
        
        updateLifeClock()
        
        guard let userProfile = userProfile, let lifeSpan = lifeSpan else {
            return
        }
        
        userNameLabel.text = userProfile.name
        
        let birthYear = String(format: "%.0f", userProfile.birthYear.setting)
        let deathYear = String(format: "%.0f", CGFloat(userProfile.birthYear.setting) + lifeSpan.modifiedALE!)
        timeSpanLabel.text = "\(birthYear) to \(deathYear)"
        
        let age = String(format: "%.0f", lifeSpan.modifiedALE!)
        agedLabel.text = "Aged \(age)"
        
    }
    
    fileprivate func updateLifeClock() {
        
        lifeSpan = createLifespanForUser()
        
        guard let lifeSpan = lifeSpan else {
            print("cant create LifeSpan")
            return
        }
        
        lifeClock = createLifeClockForUser(with: lifeSpan)
        
        guard let lifeClock = lifeClock else {
            print("cant create LifeClock")
            return
        }
        
        setClock(with: lifeClock)
        
        guard let userProfile = userProfile else {
            print("cant create userProfile")
            return
        }
        
        if CalendarUtilities.stringToTime(timeString: "00:00:00") == lifeClock.time {
            userProfile.livingOnBorrowedTime = true
        } else {
            userProfile.livingOnBorrowedTime = false
        }
        
    }
    
    fileprivate func createLifeClockForUser(with ls: Lifespan) -> LifeClock {
        
        let spanTime = ls.lifespanAsTime()
        let lc = LifeClock(time: spanTime!)
        return lc
    }
    
    fileprivate func createLifespanForUser() -> Lifespan {
        
        let birthDate = CalendarUtilities.stringToDate(dateString: userProfile!.dob)
        let ls = Lifespan(name: userProfile!.name, dateOfBirth: birthDate!, averageLifeExpectancy: userProfile!.ale)
        
        let activityLevelMod = SpanModifier(name: "activityLevel", value: CGFloat(userProfile!.activityLevel.setting), positive: true)
        ls.spanModifiers?.append(activityLevelMod)
        
        let stressLevelMod = SpanModifier(name: "stressLevel", value: CGFloat(userProfile!.stressLevel.setting), positive: false)
        ls.spanModifiers?.append(stressLevelMod)
        
        return ls
    }
    
    fileprivate func setClock(with lifeClock: LifeClock) {
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        prepareState(for: segue)
    }
    
    
}


//
//  WeekViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController, SharedState {
    
    var userProfile: UserProfile?
    var lifeSpan: Lifespan?
    var lifeClock: LifeClock?
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeSpanLabel: UILabel!
    @IBOutlet weak var agedLabel: UILabel!
    
    
    @IBOutlet weak var analysisText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userProfile = UserProfile()
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        analysisText.text = userProfile.generateAnalysis(lifeSpan: lifeSpan)
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
        
        let birthDate = CalendarUtilities.stringToDate(dateString: "02-13-\(Int(userProfile!.birthYear.setting))")
        let ls = Lifespan(name: userProfile!.name, dateOfBirth: birthDate!, averageLifeExpectancy: userProfile!.ale)
        
        let activityLevelMod = SpanModifier(name: "activityLevel", value: CGFloat(userProfile!.activityLevel.setting), positive: true)
        ls.spanModifiers?.append(activityLevelMod)
        
        let stressLevelMod = SpanModifier(name: "stressLevel", value: CGFloat(userProfile!.stressLevel.setting), positive: false)
        ls.spanModifiers?.append(stressLevelMod)
        
        return ls
    }

}


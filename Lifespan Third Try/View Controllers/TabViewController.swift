//
//  TabViewController.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 4/7/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    var userProfile: UserProfile?
    var lifeSpan: Lifespan?
    var lifeClock: LifeClock?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // TODO: Load this from phone storage
        userProfile = UserProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLifeClock() {
        
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
    
    func createLifeClockForUser(with ls: Lifespan) -> LifeClock {
        
        let spanTime = ls.lifespanAsTime()
        let lc = LifeClock(time: spanTime!)
        return lc
    }
    
    func createLifespanForUser() -> Lifespan {
        
        let birthDate = CalendarUtilities.stringToDate(dateString: "02-13-\(Int(userProfile!.birthYear.setting))")
        let ls = Lifespan(name: userProfile!.name, dateOfBirth: birthDate!, averageLifeExpectancy: userProfile!.ale)
        
        let activityLevelMod = SpanModifier(name: "activityLevel", value: CGFloat(userProfile!.activityLevel.setting), positive: true)
        ls.spanModifiers?.append(activityLevelMod)
        
        let stressLevelMod = SpanModifier(name: "stressLevel", value: CGFloat(userProfile!.stressLevel.setting), positive: false)
        ls.spanModifiers?.append(stressLevelMod)
        
        return ls
    }
    

}

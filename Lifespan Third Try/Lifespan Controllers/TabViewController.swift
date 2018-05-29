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
    var lifeBioMeter: LifeBioMeter?

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
    
    func updateLife() {
        
        lifeSpan = createLifespanForUser()
        
        guard let lifeSpan = lifeSpan else {
            print("can't create LifeSpan")
            return
        }
        
        // update the LifeClock by creating a new one
        lifeClock = createLifeClockForUser(with: lifeSpan)
        
        if let userProfile = userProfile {
            lifeBioMeter = createLifeBioMeterForUser(with: userProfile, and: lifeSpan)
        }
        
    }
    
    func createLifeBioMeterForUser(with up: UserProfile, and ls: Lifespan) -> LifeBioMeter {
        
        let lbm = LifeBioMeter(chronologicalAge: up.age, ale: up.ale, mAle: ls.modifiedALE!)
        return lbm
    }
    
    func createLifeClockForUser(with ls: Lifespan) -> LifeClock {
        
        let spanTime = ls.lifespanAsTime()
        let lc = LifeClock(time: spanTime!)
        return lc
    }
    
    func createLifespanForUser() -> Lifespan {
                
        let birthDate = CalendarUtilities.stringToDate(dateString: "\(userProfile!.birthMonth)-\(userProfile!.birthDay)-\(userProfile!.birthYear)")
        let ls = Lifespan(name: userProfile!.name, dateOfBirth: birthDate!, averageLifeExpectancy: userProfile!.ale)
        
        let activityLevelMod = SpanModifier(name: "activityLevel", value: CGFloat(userProfile!.activityLevel.setting), effect: .positive)
        ls.spanModifiers?.append(activityLevelMod)
        
        let stressLevelMod = SpanModifier(name: "stressLevel", value: CGFloat(userProfile!.stressLevel.setting), effect: .negative)
        ls.spanModifiers?.append(stressLevelMod)
        
        let riskLevelMod = SpanModifier(name: "riskLevel", value: CGFloat(userProfile!.riskLevel.setting), effect: .negative)
        ls.spanModifiers?.append(riskLevelMod)
        
        let geneticsQualityMod = SpanModifier(name: "geneticsQuality", value: CGFloat(userProfile!.geneticsLevel.setting), effect: .both)
        ls.spanModifiers?.append(geneticsQualityMod)
        
        return ls
    }
    

}

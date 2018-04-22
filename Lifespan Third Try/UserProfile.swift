//
//  UserProfile.swift
//  Lifespan 2018
//
//  Created by jpavley12 on 2/24/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation
import CoreGraphics

struct RangedValue {
    var min: Float = 0.0
    var max: Float = 1.0
    var setting: Float = 0.5
    
    func settingAsInt() -> Int {
        return Int(setting.rounded(.down))
    }
    
}

struct PronounTrio {
    var subjective: String = "he" // she, they
    var objective: String = "him" // her, them
    var possessive: String = "his" // hers, theirs
}

struct UserStats {
    var age: Int = 0
    var birthYear: Int = 0
    var lifeExpectancy: Int = 0
    var modifiedLifeExpectancy: Int = 0
    var missingYears: Int = 0
    var modifiedDeathYear: Int = 0
}

/// Models a user of Lifespan.
/// A good source for life expentancy is // https://www.ssa.gov/planners/lifeexpectancy.html
class UserProfile {
    
    var name:String
    
    var birthYear: RangedValue
    var birthDay: RangedValue
    var birthMonth: RangedValue
    
    var lifeExpectancy: RangedValue
    
    var activityLevel: RangedValue
    var stressLevel: RangedValue
    var riskLevel: RangedValue
    var geneticsLevel: RangedValue
    
    var livingOnBorrowedTime: Bool
    var pronouns: PronounTrio
    
    init() {
        name = "John F. Pavley"
        
        let birthYearMin = CalendarUtilities.thisYear() - 120
        let birthYearMax = CalendarUtilities.thisYear()
        birthYear = RangedValue(min: Float(birthYearMin), max: Float(birthYearMax), setting: 1961)
        
        let birthDayMin = 1
        let birthDayMax = 31
        birthDay = RangedValue(min: Float(birthDayMin), max: Float(birthDayMax), setting: 13)
        
        let birthMonthMin = 1
        let birthMonthMax = 12
        birthMonth = RangedValue(min: Float(birthMonthMin), max: Float(birthMonthMax), setting: 2)
        
        
        let lifeExpectancyMin = Float(CalendarUtilities.thisYear()) - birthYear.setting
        let lifeExpectancyMax = Float(120)
        lifeExpectancy = RangedValue(min: lifeExpectancyMin, max: lifeExpectancyMax, setting: 83)
        
        activityLevel = RangedValue(min: 0, max: 10, setting: 8)
        stressLevel = RangedValue(min: 0, max: 10, setting: 6)
        riskLevel = RangedValue(min: 0, max: 10, setting: 4)
        geneticsLevel = RangedValue(min: 0, max: 10, setting: 2)
        
        livingOnBorrowedTime = false
        pronouns = PronounTrio(subjective:"he", objective: "him", possessive: "his")
    }
    
    func calcUserStats(from lifeSpan: Lifespan) -> UserStats {
        
        var us = UserStats()
        
        us.age = Int(age)
        us.birthYear = Int(birthYear.setting.rounded(.down))
        us.lifeExpectancy = Int(ale.rounded(.down))
        us.modifiedLifeExpectancy = Int(lifeSpan.modifiedALE!.rounded(.down))
        us.missingYears = abs(us.modifiedLifeExpectancy - us.lifeExpectancy)
        us.modifiedDeathYear = us.birthYear + us.modifiedLifeExpectancy
        
        return us
    }
    
    var ale: CGFloat {
        get {
            return CGFloat(lifeExpectancy.setting).rounded(.down)
        }
    }
    
    var age: CGFloat {
        get {            
            // humans always round down their age!
            let userAge = Float(CalendarUtilities.thisYear()) - birthYear.setting.rounded(.down)
            return CGFloat(userAge)
        }
    }
    
    var activity: CGFloat {
        get {
            return CGFloat(activityLevel.setting)
        }
    }
    
    var stress: CGFloat {
        get {
            return CGFloat(stressLevel.setting)
        }
    }
    
    var risk: CGFloat {
        get {
            return CGFloat(riskLevel.setting)
        }
    }
    
    var genetics: CGFloat {
        get {
            return CGFloat(geneticsLevel.setting)
        }
    }
    
}

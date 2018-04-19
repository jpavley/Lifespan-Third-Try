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
        return Int(setting.rounded(.awayFromZero))
    }
    
}

struct PronounTrio {
    var subjective: String = "he"
    var objective: String = "him"
    var possessive: String = "his"
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
        birthYear = RangedValue(min: birthYearMin, max: birthYearMax, setting: 1961)
        
        let birthDayMin = 1
        let birthDayMax = 31
        birthDay = RangedValue(min: Float(birthDayMin), max: Float(birthDayMax), setting: 13)
        
        let birthMonthMin = 1
        let birthMonthMax = 12
        birthMonth = RangedValue(min: Float(birthMonthMin), max: Float(birthMonthMax), setting: 2)
        
        
        let lifeExpectancyMin = CalendarUtilities.thisYear() - birthYear.setting
        let lifeExpectancyMax = Float(120)
        lifeExpectancy = RangedValue(min: lifeExpectancyMin, max: lifeExpectancyMax, setting: 83)
        
        activityLevel = RangedValue(min: 0, max: 10, setting: 8)
        stressLevel = RangedValue(min: 0, max: 10, setting: 6)
        riskLevel = RangedValue(min: 0, max: 10, setting: 4)
        geneticsLevel = RangedValue(min: 0, max: 10, setting: 2)
        
        livingOnBorrowedTime = false
        pronouns = PronounTrio(subjective:"he", objective: "him", possessive: "his")
    }
    
    var ale: CGFloat {
        get {
            return CGFloat(lifeExpectancy.setting)
        }
    }
    
    var age: CGFloat {
        get {
            return CGFloat(CalendarUtilities.thisYear() - birthYear.setting)
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
    
}

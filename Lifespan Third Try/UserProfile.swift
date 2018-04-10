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
    var lifeExpectancy: RangedValue
    var activityLevel: RangedValue
    var stressLevel: RangedValue
    var livingOnBorrowedTime: Bool
    var pronouns: PronounTrio
    
    init() {
        name = "John F. Pavley"
        
        let birthYearMin = CalendarUtilities.thisYear() - 120
        let birthYearMax = CalendarUtilities.thisYear()
        birthYear = RangedValue(min: birthYearMin, max: birthYearMax, setting: 1961)
        
        let lifeExpectancyMin = CalendarUtilities.thisYear() - birthYear.setting
        lifeExpectancy = RangedValue(min: lifeExpectancyMin, max: 120, setting: 83)
        
        activityLevel = RangedValue(min: 0, max: 10, setting: 9)
        stressLevel = RangedValue(min: 0, max: 10, setting: 3)
        
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

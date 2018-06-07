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

/// Data generally shared across views from the LifeSpan and LifeBioMeter
/// objects. Calculation of this data is centralized in the creation of
/// this data structure.
struct UserStats {
    
    // lifespan properties
    var age: Int = 0
    var birthYear: Int = 0
    var lifeExpectancy: Int = 0
    var modifiedLifeExpectancy: Int = 0
    var missingYears: Int = 0
    var modifiedDeathYear: Int = 0
    var hoursBeyondALE: CGFloat = 0.0
    
    // life biometer properties
    var chronologicalAge: Int = 0
    var biologicalAge: Int = 0
    var lifeBonus: Int = 0
}

let maxHumanLifeExpectancy = 120
let minHumanLifeExpectancy = 0

/// Models a user of Lifespan.
/// A good source for life expentancy is // https://www.ssa.gov/planners/lifeexpectancy.html
/// An interesting question is this: Is the user alive or dead and does this model care?
/// No. The model doesn't care about the state of the user's ghost. What model cares about
/// is the user's life expectancy and how it is effect by life factors. If the user is dead,
/// is PII. However, if the model detects that the user seems to be alive beyond their
/// life expectancy then the user is "living on borrow time" and that fact is important
/// to the LifeClock and Analysis. Living past your life expectancy means the LifeClock is
/// set to 00:00:00 (12 midnight) and the analysis might want to mention it's no longer
/// able to predict how much time the user has left.
class UserProfile {
    
    var name: String
    var birthDate: Date
    var pronounChoices: RangedValue
    var lifeExpectancy: RangedValue
    
    var activityLevel: RangedValue
    var stressLevel: RangedValue
    var riskLevel: RangedValue
    var geneticsLevel: RangedValue
        
    init() {
        name = "John F. Pavley"
        birthDate = CalendarUtilities.stringToDate(dateString: "02-13-1961")!
        
        let cal = CalendarUtilities.utcCal()
        let birthYear = cal.component(.year, from: birthDate)
        let lifeExpectancyMin = Float(CalendarUtilities.thisYear() - birthYear)
        let lifeExpectancyMax = Float(maxHumanLifeExpectancy)
        lifeExpectancy = RangedValue(min: lifeExpectancyMin, max: lifeExpectancyMax, setting: 83)
        // setLifeExpectancy(with: 83)
        
        activityLevel = RangedValue(min: 0, max: 10, setting: 0)
        stressLevel = RangedValue(min: 0, max: 10, setting: 0)
        riskLevel = RangedValue(min: 0, max: 10, setting: 0)
        geneticsLevel = RangedValue(min: 0, max: 10, setting: 0)
                
        pronounChoices = RangedValue(min: Float(PronounGender.female.rawValue),
                                     max: Float(PronounGender.male.rawValue),
                                     setting: Float(PronounGender.male.rawValue))
    }
    
    fileprivate func setLifeExpectancy(with ale: Float) {
        let lifeExpectancyMin = Float(CalendarUtilities.thisYear() - birthYear)
        let lifeExpectancyMax = Float(maxHumanLifeExpectancy)
        lifeExpectancy = RangedValue(min: lifeExpectancyMin, max: lifeExpectancyMax, setting: ale)
    }
    
    func calcUserStats(from lifeSpan: Lifespan, and lbm: LifeBioMeter) -> UserStats {
        
        var us = UserStats()
        
        us.age = Int(age)
        us.birthYear = birthYear
        us.lifeExpectancy = Int(ale.rounded(.down))
        us.modifiedLifeExpectancy = Int(lifeSpan.modifiedALE!.rounded(.down))
        us.missingYears = abs(us.modifiedLifeExpectancy - us.lifeExpectancy)
        us.modifiedDeathYear = us.birthYear + us.modifiedLifeExpectancy
        us.hoursBeyondALE = lifeSpan.hoursBeyondALE
        
        us.chronologicalAge = Int(lbm.chronologicalAge.rounded(.down))
        us.biologicalAge = Int(lbm.biologicalAge.rounded(.down))
        us.lifeBonus = lbm.lifeBonus
        
        return us
    }
    
    func setBirthDate(with newDate: Date) {
        birthDate = newDate
        let currentLifeExpectancy = lifeExpectancy.setting
        setLifeExpectancy(with: currentLifeExpectancy)
    }
    
    var birthYear: Int {
        let cal = CalendarUtilities.utcCal()
        let year = cal.component(.year, from: birthDate)
        return year
    }
    
    var birthMonth: Int {
        let cal = CalendarUtilities.utcCal()
        let month = cal.component(.month, from: birthDate)
        return month
    }
    
    var birthDay: Int {
        let cal = CalendarUtilities.utcCal()
        let day = cal.component(.day, from: birthDate)
        return day
    }
    
    var pronouns: PronounTrio {
        let currentSetting = pronounChoices.settingAsInt()
        let gender = PronounGender(rawValue: currentSetting)
        return PronounTrio.getPronouns(for: gender!)
    }
    
    var ale: CGFloat {
        get {
            return CGFloat(lifeExpectancy.setting).rounded(.down)
        }
    }
    
    var age: CGFloat {
        get {            
            // humans always round down their age!
            let userAge = CalendarUtilities.thisYear() - birthYear
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

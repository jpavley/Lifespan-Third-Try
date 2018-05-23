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

struct UserStats {
    var age: Int = 0
    var birthYear: Int = 0
    var lifeExpectancy: Int = 0
    var modifiedLifeExpectancy: Int = 0
    var missingYears: Int = 0
    var modifiedDeathYear: Int = 0
    var hoursBeyondALE: CGFloat = 0.0
}

let maxHumanLifeExpectancy = 122

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
    
    var name:String
    var pronounChoices: RangedValue

    var birthYear: RangedValue
    var birthDay: RangedValue
    var birthMonth: RangedValue
    
    var lifeExpectancy: RangedValue
    
    var activityLevel: RangedValue
    var stressLevel: RangedValue
    var riskLevel: RangedValue
    var geneticsLevel: RangedValue
        
    init() {
        name = "John F. Pavley"
        
        let birthYearMin = CalendarUtilities.thisYear() - maxHumanLifeExpectancy
        let birthYearMax = CalendarUtilities.thisYear()
        birthYear = RangedValue(min: Float(birthYearMin), max: Float(birthYearMax), setting: 1961)
        
        let birthDayMin = 1
        let birthDayMax = 31
        birthDay = RangedValue(min: Float(birthDayMin), max: Float(birthDayMax), setting: 13)
        
        let birthMonthMin = 1
        let birthMonthMax = 12
        birthMonth = RangedValue(min: Float(birthMonthMin), max: Float(birthMonthMax), setting: 2)
        
        
        let lifeExpectancyMin = Float(CalendarUtilities.thisYear()) - birthYear.setting
        let lifeExpectancyMax = Float(maxHumanLifeExpectancy)
        lifeExpectancy = RangedValue(min: lifeExpectancyMin, max: lifeExpectancyMax, setting: 83)
        
        activityLevel = RangedValue(min: 0, max: 10, setting: 0)
        stressLevel = RangedValue(min: 0, max: 10, setting: 0)
        riskLevel = RangedValue(min: 0, max: 10, setting: 0)
        geneticsLevel = RangedValue(min: 0, max: 10, setting: 0)
                
        pronounChoices = RangedValue(min: Float(PronounGender.female.rawValue),
                                     max: Float(PronounGender.male.rawValue),
                                     setting: Float(PronounGender.male.rawValue))
    }
    
    func calcUserStats(from lifeSpan: Lifespan) -> UserStats {
        
        var us = UserStats()
        
        us.age = Int(age)
        us.birthYear = Int(birthYear.setting.rounded(.down))
        us.lifeExpectancy = Int(ale.rounded(.down))
        us.modifiedLifeExpectancy = Int(lifeSpan.modifiedALE!.rounded(.down))
        us.missingYears = abs(us.modifiedLifeExpectancy - us.lifeExpectancy)
        us.modifiedDeathYear = us.birthYear + us.modifiedLifeExpectancy
        us.hoursBeyondALE = lifeSpan.hoursBeyondALE
        
        return us
    }
    
    func setBirthDate(with newDate: Date) {
        let cal = CalendarUtilities.utcCal()
        
        let month = cal.component(.month, from: newDate)
        birthMonth.setting = Float(month)
        
        let day = cal.component(.day, from: newDate)
        birthDay.setting = Float(day)
        
        let year = cal.component(.year, from: newDate)
        birthYear.setting = Float(year)
    }
    
    var pronouns: PronounTrio {
        let currentSetting = pronounChoices.settingAsInt()
        let gender = PronounGender(rawValue: currentSetting)
        return PronounTrio.getPronouns(for: gender!)
    }
    
    var birthDate: Date {
        
        let birthDateString = "\(birthMonth.settingAsInt())-\(birthDay.settingAsInt())-\(birthYear.settingAsInt())"
        if let birthDate = CalendarUtilities.stringToDate(dateString: birthDateString) {
            return birthDate
        } else {
            print("Error calculating birthdate")
            return Date()
        }
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

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
        
        activityLevel = RangedValue(min: 0, max: 10, setting: 0)
        stressLevel = RangedValue(min: 0, max: 10, setting: 10)
        
        livingOnBorrowedTime = false
        pronouns = PronounTrio(subjective:"he", objective: "him", possessive: "his")
    }
    
    func generateAnalysis(lifeSpan: Lifespan) -> String {
        
        let name = self.name
        let subject = self.pronouns.subjective
        let object = self.pronouns.objective
        let possesser = self.pronouns.possessive
        let age = Int(self.age.rounded(.awayFromZero))
        let birthYear = Int(self.birthYear.setting.rounded(.awayFromZero))
        let lifeExpectancy = Int(self.ale.rounded(.awayFromZero))
        let modifiedLifeExpectancy = Int(lifeSpan.modifiedALE!.rounded(.awayFromZero))
        let missingYears = abs(modifiedLifeExpectancy - lifeExpectancy)
        let modifiedDeathYear = birthYear + modifiedLifeExpectancy
        let unmodifiedDeathYear = birthYear + lifeExpectancy
        let cal = CalendarUtilities.utcCal()
        let thisYear = cal.component(.year, from: Date())
        let modifiedYearsLeft = modifiedDeathYear - thisYear
        let hours00 = String(format: "%02d", lifeSpan.hourHandValue)
        let minuets00 = String(format: "%02d", lifeSpan.minuteHandValue)
        let seconds00 = String(format: "%02d", lifeSpan.secondHandValue)
        let hours = lifeSpan.hourHandValue
        let minuets = lifeSpan.minuteHandValue
        let seconds = lifeSpan.secondHandValue
        
        let stressLevel = stress >= 5 ? "high" : "low"
        let activityLevel = activity >= 5 ? "hight" : "low"
        
        // Analysis is negative, neutral, positive, or universal
        // Negative: mALE < ale
        // Neutral: mALE == ale
        // Positive: mALE > ale
        // Universal: not impacted by the relation between mALE and ale
        
        var p1 = ""
        let p2 = "If \(name) lives beyond \(modifiedDeathYear) and the age of \(modifiedLifeExpectancy), \(subject) will be living on borrowed time."
        let p3 = "The life clock of \(name) is set to \(hours00):\(minuets00):\(seconds00), that is \(hours) hours, \(minuets) minutes, and \(seconds) seconds spent with 3 hours, 51 minutes, and 37 seconds remaining. In this life clock each hour represents 6.92 years, each minute represents 1.38 months, and each second represents 0.7 days."
        var p4 = ""

        if modifiedLifeExpectancy < lifeExpectancy {
            
            // negative
            
            p1 = "\(name) was born \(age) years ago in \(birthYear). \(possesser.capitalized) life expectancy of \(lifeExpectancy) years is influenced by a \(activityLevel) level of physical activity and a \(stressLevel) level of mental stress, and thus reduced to \(modifiedLifeExpectancy) years, robbing \(object) of \(missingYears) years. If \(subject) doesn’t improve \(possesser) life style \(subject) could die in \(modifiedYearsLeft) years from today, in the year \(modifiedDeathYear)."
            
            p4 = "If \(name) is able to lower \(possesser) mental stress and increase \(possesser) physical activity \(subject) could add \(missingYears) years to \(possesser) life expectancy, live to the age of \(lifeExpectancy), and see the dawn of New Year’s Day in \(unmodifiedDeathYear)."
            
        } else if modifiedLifeExpectancy == lifeExpectancy {
            
            // neutral
            
        } else if modifiedLifeExpectancy > lifeExpectancy {
            // positive
        }
        
        let cr = "\n\n"
        return "\(p1)\(cr)\(p2)\(cr)\(p3)\(cr)\(p4)"
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

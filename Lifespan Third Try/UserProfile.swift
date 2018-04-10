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
        
        activityLevel = RangedValue(min: 0, max: 10, setting: 5)
        stressLevel = RangedValue(min: 0, max: 10, setting: 5)
        
        livingOnBorrowedTime = false
        pronouns = PronounTrio(subjective:"he", objective: "him", possessive: "his")
    }
    
    fileprivate func levelToText(level: CGFloat,
                                 words: [String] = ["low", "moderate", "high", "unknown"]) -> String {
        
        enum Levels: Int {
            case low = 0, moderate = 1, high = 2, unknown = 3
        }
        
        switch UInt(level) {
        case 0...4:
            return words[Levels.low.rawValue]
        case 5:
            return words[Levels.moderate.rawValue]
        case 6...:
            return words[Levels.high.rawValue]
        default:
            return words[Levels.unknown.rawValue]
        }
    }
    
    struct ParagraphOneData {
        let name: String
        let age: Int
        let birthYear: Int
        let modifiedLifeExpectancy: Int
        let lifeExpectancy: Int
        let possesser: String
        let object: String
        let subject: String
        let missingYears: Int
        let modifiedYearsLeft: Int
        let modifiedDeathYear: Int
        let stressLevel: String
        let activityLevel: String
    }
    
    fileprivate func generateParagraphOne(with d: ParagraphOneData) -> String {
        var s1 = ""
        var s2 = ""
        if d.modifiedLifeExpectancy < d.lifeExpectancy {
            
            // negative
            
            s1 = "\(d.name) was born \(d.age) years ago in \(d.birthYear). \(d.possesser.capitalized) life expectancy of \(d.lifeExpectancy) years is influenced by a \(activityLevel) level of physical activity and a \(stressLevel) level of mental stress, and thus reduced to \(d.modifiedLifeExpectancy) years, robbing \(d.object) of \(d.missingYears) years."
            
            s2 = "If \(d.subject) doesn’t improve \(d.possesser) life style \(d.subject) could die in \(d.modifiedYearsLeft) years from today, in the year \(d.modifiedDeathYear)."
            
        } else if d.modifiedLifeExpectancy == d.lifeExpectancy {
            
            // neutral
            
            s1 = "\(d.name) was born \(d.age) years ago in \(d.birthYear). \(d.possesser.capitalized) life expectancy of \(d.lifeExpectancy) years is influenced by a \(d.activityLevel) level of physical activity and a \(d.stressLevel) level of mental stress, and thus unchanged with no missing or extra years."
            
            s2 = "If \(d.subject) is able to maintain \(d.possesser) current life style \(d.subject) could die in \(d.modifiedYearsLeft) years from today, in the year \(d.modifiedDeathYear)."
            
        } else if d.modifiedLifeExpectancy > d.lifeExpectancy {
            
            // positive
            
            s1 = "\(d.name) was born \(d.age) years ago in \(d.birthYear). \(d.possesser.capitalized) life expectancy of \(d.lifeExpectancy) years is influenced by a \(d.activityLevel) level of physical activity and a \(d.stressLevel) level of mental stress, and thus increased to \(d.modifiedLifeExpectancy) years, gifting \(d.object) another \(d.missingYears) years."
            
            s2 = "If \(d.subject) is able to maintain \(d.possesser) current life style \(d.subject) could live for another \(d.modifiedYearsLeft) years from today, and delay his death until the year \(d.modifiedDeathYear)."
        }
        return "\(s1) \(s2)"

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
        let cal = CalendarUtilities.utcCal()
        let now = Date()
        let thisWeekDay = cal.weekdaySymbols[cal.component(.weekday, from: now)-1]
        let thisDay = cal.component(.day, from: now)
        let thisMonth = cal.monthSymbols[cal.component(.month, from: now)-1]
        let thisYear = cal.component(.year, from: now)
        let modifiedYearsLeft = modifiedDeathYear - thisYear
        let stressLevel = levelToText(level: stress)
        let activityLevel = levelToText(level: activity)
        let cr = "\n\n"
        
        let p0 = "Today is \(thisWeekDay), \(thisMonth) \(thisDay), \(thisYear). \(name) has spent \(lifeSpan.clockDescriptionSpent) in \(possesser) life to date. At this point in time \(subject) could live for another \(lifeSpan.clockDescriptionRemaining)."
        
        let p1 = generateParagraphOne(with: ParagraphOneData(name: name,
                                                             age: age,
                                                             birthYear: birthYear,
                                                             modifiedLifeExpectancy: modifiedLifeExpectancy,
                                                             lifeExpectancy: lifeExpectancy,
                                                             possesser: possesser,
                                                             object: object,
                                                             subject: subject,
                                                             missingYears: missingYears,
                                                             modifiedYearsLeft: modifiedYearsLeft,
                                                             modifiedDeathYear: modifiedDeathYear,
                                                             stressLevel: stressLevel,
                                                             activityLevel: activityLevel))
        
        // Universal
        let p2 = "If \(name) lives beyond \(modifiedDeathYear) and the age of \(modifiedLifeExpectancy), \(subject) will be living on borrowed time."
        
        return "\(p0)\(cr)\(p1)\(cr)\(p2)"
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

//
//  Lifespan.swift
//  Lifespan 2018
//
//  Created by John Pavley on 2/23/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation
import CoreGraphics

/// When we're only interested in the time components of the date
typealias Time = Date

struct LifeEvent {
    var title: String
    var description: String
    var date: Date
}

enum SpanModifierEffect {
    case positive, negative, both
}

struct SpanModifier {
    var name: String
    var value: CGFloat
    var effect: SpanModifierEffect
}

extension CGFloat {
    var divisor: CGFloat {
        return self.rounded(.down)
    }
    var remainder: CGFloat {
        return self - self.divisor
    }
}

class Lifespan {
    
    var name: String?
    var birth: LifeEvent?
    var death: LifeEvent?
    var lifeEvents: [Lifespan]?
    var averageLifeExpectancy: CGFloat?
    var spanModifiers: [SpanModifier]?
    
    var hourHandValue = 0
    var minuteHandValue = 0
    var secondHandValue = 0
    
    var hoursBeyondALE:CGFloat = 0.0
    
    var hoursRemaining: Int {
        
        if minuteHandValue == 0 && secondHandValue == 0 {
            return 12 - hourHandValue
        } else {
            // minuets and seconds eat into the final hour
            return 11 - hourHandValue
        }
    }
    
    var minutesRemaining: Int {
        if secondHandValue == 0 {
            return 60 - minuteHandValue
        } else {
            // seconds eat into the final second
            return 59 - minuteHandValue
        }
    }
    
    var secondsRemaining: Int {
        return 60 - secondHandValue
    }
    
    var clockDescriptionRemaining: String {
        return "\(hoursRemaining) hours, \(minutesRemaining) minutes, \(secondsRemaining) seconds"
    }
    
    var clockDescriptionSpent: String {
        return "\(hourHandValue) hours, \(minuteHandValue) minutes, \(secondHandValue) seconds"
    }
    
    func unitsPerSlice(units: CGFloat, slices: CGFloat) -> CGFloat {
        return units / slices
    }
    
    var yearsPerHour: String {
        if let mALE = modifiedALE {
            let hoursIn12HourDay: CGFloat = 12
            let hourSpan = unitsPerSlice(units: mALE, slices: hoursIn12HourDay)
            let hourSpanString = String(format: "%.2f", hourSpan)
            return "\(hourSpanString)"
        } else {
            return ""
        }
    }
    
    
    var monthsPerMinutes: String {
        if let mALE = modifiedALE {
            let monthsInYearSpan: CGFloat = 12 * mALE
            let minuetsIn12HourDay: CGFloat = 60 * 12
            let minSpan = unitsPerSlice(units: monthsInYearSpan, slices: minuetsIn12HourDay)
            let minSpanString = String(format: "%.2f", minSpan)
            return "\(minSpanString)"
        } else {
            return ""
        }
    }
    
    
    var daysPerSeconds: String {
        if let mALE = modifiedALE {
            let daysInYearSpan: CGFloat = 365.4 * mALE
            let secondsIn12HourDay: CGFloat = 60 * 60 * 12
            let secSpan = unitsPerSlice(units: daysInYearSpan, slices: secondsIn12HourDay)
            let secSpanString = String(format: "%.2f", secSpan)
            return "\(secSpanString)"
        } else {
            return ""
        }
    }
    
    
    /// Calcuates and returns ALE with span modifiers applied.
    /// Currently all span modifiers have the same impact on
    /// Lifespan: increases 10% of lifespan by modifier value.
    /// Thus a modifier with value of 10 increases lifespan by
    /// 10%. ALE must be between 0 and 120
    var modifiedALE: CGFloat? {
        guard let spanModifiers = spanModifiers, let ale = averageLifeExpectancy else {
            return nil
        }
        
        let valueOfMostFactors: CGFloat = 0.01
        let valueOfGenetics: CGFloat = 0.02
        
        var modifiedALE = averageLifeExpectancy!
        var lifeFraction = ale * valueOfMostFactors
        for mod in spanModifiers {
            
            if mod.name == "geneticsQuality" {
                lifeFraction = ale * valueOfGenetics
            }
            
            let modImpact = lifeFraction * mod.value
            
            switch mod.effect {
            case .positive:
                modifiedALE += modImpact
            case .negative:
                modifiedALE -= modImpact
            case .both:
                if mod.value < 5.0 {
                    // negative effect
                    modifiedALE -= modImpact
                } else if mod.value == 5.0 {
                     // no effect
                    modifiedALE += 0
                } else {
                    // positive effect
                    modifiedALE += modImpact
                }
            }
            
        }
                
        if modifiedALE > 120 {
            modifiedALE = 120
        }
        
        if modifiedALE < 0 {
            modifiedALE = 0
        }
        
        return modifiedALE
    }
    
    
    init(name: String, dateOfBirth: Date, averageLifeExpectancy: CGFloat) {
        self.name = name
        birth = LifeEvent(title: "Birth", description: "", date: dateOfBirth)
        self.averageLifeExpectancy = averageLifeExpectancy
        spanModifiers = [SpanModifier]()
    }
    
    /// Models lifespan as 12 hour half-day from noon to midnight.
    ///
    /// - Returns: Current age as the time left between birth and
    ///            death based on average life expectancy.
    func lifespanAsTime() -> Time? {
        
        guard let b = birth, let mALE = modifiedALE else {
            return nil
        }
        
        // Algorithm: Calc remaining lifespan as clock time
        // 1. adjustedAgeInYears = thisYear - birthYear
        // 2. percentOfLifeSpent = (adjustedAgeInYears + percent of year spent so far)/expectedLifespan
        // 3. timeSpent = 12 * percentOfLifeSpent
        // 4. hourHandValue = timeSpent divisor
        // 5. minutesSpent = 60 * timeSpent remainder (60 * % of an hour remaining)
        // 6. minuteHandValue = minutesSpent divisor
        // 7. secondHandValue = 60 * minutesSpent remainder (60 * % of a minuet remaining)
        
        let ageInYears = CalendarUtilities.yearsFromNow(from: b.date)
        let ageInDays = CalendarUtilities.daysFromNow(from: b.date)
        
        let elaspedDays = Double(ageInYears) * 365.4
        let leftOverDays = Double(ageInDays) - elaspedDays
        let percentOfThisYearSpent = leftOverDays/365.4
        let adjustedAgeInYears = Double(ageInYears) + percentOfThisYearSpent
        
        var percentOfLifeSpent: CGFloat = 0
        if mALE > 0 {
            percentOfLifeSpent = CGFloat(adjustedAgeInYears)/mALE
        }
        
        var timeSpent = 12 * percentOfLifeSpent
        
        if timeSpent > 12.0 {
            // user is living on borrowed time
            // save the amount of "over time"
            hoursBeyondALE = timeSpent
            // set the time to 12 midnight
            timeSpent = 12.0
        } else {
            hoursBeyondALE = 0.0
        }
        
        hourHandValue = Int(timeSpent.divisor)
        let hoursRemainder = timeSpent.remainder
        
        let minutesSpent = 60 * hoursRemainder
        minuteHandValue = Int(minutesSpent.divisor)
        
        let secondsSpent = 60 * minutesSpent.remainder
        secondHandValue = Int(secondsSpent.divisor)
        
        let timeString = "\(hourHandValue):\(minuteHandValue):\(secondHandValue)"
        let time = CalendarUtilities.stringToTime(timeString: timeString)
        
        return time
    }
}

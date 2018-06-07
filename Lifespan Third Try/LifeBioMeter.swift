//
//  LifeBioMeter.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/29/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation
import CoreGraphics

/// Model of a partial dial that displays the difference between chronological age (what the calendar says) and biological age (what your doctor says).
///
/// LifeFactor is the ratio of modified ALE to unmodified ALE (ale/mALE). LifeFactor is used to calculate biological age based on mALE.
/// - If a user's mALE is higher than his ale then his LifeFactor is lower and his biological age is less than his chronological age.
/// - If a users mALE is lower than his ale than his LifeFactor is higher and his biological age is more than his chrological age.
///
/// LifeBonus is a percentage that describes the positive or negative effect of LifeFactor on a user's life span.
/// - If there is no effect (ale == mALE) LifeBonus is 0%
/// - If there is a positivie effect LifeBonus is  > 0%
/// - If there is a negative effect LifeBonus is < 0%
/// - A negative LifeBonus is a "LifePenality"
class LifeBioMeter {
    
    var chronologicalAge: CGFloat
    var biologicalAge: CGFloat
    var lifeFactor: CGFloat
    
    let minAge: CGFloat = 0.0
    let maxAge: CGFloat = 120.0
    
    let startingAngle: CGFloat = 120.0
    let totalDegrees: CGFloat = 240.0
    
    init(chronologicalAge: CGFloat, ale: CGFloat, mAle: CGFloat) {
        self.chronologicalAge = chronologicalAge
        lifeFactor = ale/mAle
        biologicalAge = chronologicalAge * lifeFactor
        
        biologicalAge = biologicalAge > maxAge ? maxAge : biologicalAge
    }
    
    /// Maps chronological age to a the angle of of the chronological hand of the biometer.
    ///
    /// - Age 120 (max age) = 120 degrees (4 o'clock)
    /// - Age 60 = 0 degrees (12 o'clock)
    /// - Age 0 = -120 degrees (8 o'clock)
    var chronAgeHandAngle: CGFloat {
        get {
            let percentOfMaxAge = chronologicalAge/maxAge
            return (percentOfMaxAge * totalDegrees) - startingAngle
        }
    }
    
    var bioAgeHandAngle: CGFloat {
        get {
            // TODO: this is almost the same code as chronAgeHandAngle so it should be refactored into a common function
            let percentOfMaxAge = biologicalAge/maxAge
            return (percentOfMaxAge * totalDegrees) - startingAngle
        }
        
    }
    
    func daysSpent(from birthDate: Date,  to compareDate: Date = Date()) -> [Int] {
        
        // Convert the number of days from Now to the user's birthday to an array of Ints
        // for display in the odometer
        let dayCount = CalendarUtilities.days(from: birthDate, to: compareDate)
        let dayCountString = String(dayCount)
        let dayCountArray = dayCountString.map { String($0) }
        var rightSizedArray: [String]
        
        // the Odometer only has 6 slots for 6 Ints
        if dayCountArray.count < 6 {
            
            // pad left
            let difference = 6 - dayCountArray.count
            rightSizedArray = Array(repeating: "0", count: difference)
            rightSizedArray += dayCountArray
            
        } else {
            
            // drop right (honestly this will never happen!)
            rightSizedArray = Array(dayCountArray[..<6])
        }
        
        let finalArray = rightSizedArray.map { Int($0)! }
        return finalArray
    }
    
    var lifeBonus: Int {
        get {
            let r = 1.0 - lifeFactor
            let p = r * 100
            return Int(p)
        }
        
    }
}

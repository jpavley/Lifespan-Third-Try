//
//  LifeBioMeter.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/29/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation
import CoreGraphics

/// Model of a partial dial that displays the difference between
/// chronological age (what the calendar says) and biological age
/// (what your doctor says).
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
    }
    
    var chronAgeHandAngle: CGFloat {
        get {
            let percentOfMaxAge = chronologicalAge/maxAge
            return (percentOfMaxAge * totalDegrees) - startingAngle
        }
    }
    
    var bioAgeHandAngle: CGFloat {
        get {
            let percentOfMaxAge = biologicalAge/maxAge
            return (percentOfMaxAge * totalDegrees) - startingAngle
        }
        
    }
    
    var daysSpent: [Int] {
        get {            
            return [0,0,0,0,0,0]
        }
        
    }
    var lifeBonus: Int {
        get {
            return Int((1.0 - lifeFactor) * 100)
        }
        
    }
}

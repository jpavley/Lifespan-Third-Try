//
//  LifeBioMeter.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/29/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation
import CoreGraphics

class LifeBioMeter {
    
    var chronologicalAge: CGFloat
    var biologicalAge: CGFloat
    var lifeFactor: CGFloat
    
    let minAge: CGFloat = 0.0
    let maxAge: CGFloat = 120.0
    
    init(chronologicalAge: CGFloat, ale: CGFloat, mAle: CGFloat) {
        self.chronologicalAge = chronologicalAge
        lifeFactor = ale/mAle
        biologicalAge = chronologicalAge * lifeFactor
    }
    
    var chronAgeHandAngle: CGFloat {
        get {
            return 0.0
        }
    }
    
    var bioAgeHandAngle: CGFloat {
        get {
            return 0.0
        }
        
    }
    
    var secondsSpent: [Int] {
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

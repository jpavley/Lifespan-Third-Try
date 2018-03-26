//
//  LifeClock.swift
//  Lifespan 2018
//
//  Created by jpavley12 on 2/19/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation
import CoreGraphics

/// Model of a 12 hour analog clock with hour, minute, and second hands.
/// Angular velocity, ω, of each hand:
/// Second hand: ωs = 360° per minute = 6° per second.
/// Minute hand: ωm = 360° per hour = 6° per minute = 0.1° per second.
/// Hour hand: ωh = 360° per 12 hours = 30° per hour = 0.5° per minute = 0.00833333 per second.
/// https://sites.google.com/site/mymathclassroom/trigonometry/clock-angle-problems/clock-angle-problems-involving-second-hands
class LifeClock: CustomStringConvertible {
    
    var name: String
    
    var description: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        return formatter.string(from: time)
    }
    
    var time: Date
    
    /// Angular velocity in minutes
    let ωHourHand: CGFloat = (360/12)/60
    
    /// Angular velocity in seconds
    let ωMinuteHand: CGFloat = (360/60)/60
    
    /// Angular velocity in seconds
    let ωSecondHand: CGFloat = 360/60
    
    var hourHandAngle: CGFloat {
        get {
            let cal = CalendarUtilities.utcCal()
            let hour = cal.component(.hour, from: time)
            let minutes = Calendar.current.component(.minute, from: time)
            let totalMinutes = (60 * hour) + minutes
            let angle = ωHourHand * CGFloat(totalMinutes)
            return angle
        }
    }
    var minuteHandAngle: CGFloat {
        get {
            let cal = CalendarUtilities.utcCal()
            let minutes = cal.component(.minute, from: time)
            let seconds = cal.component(.second, from: time)
            return ωMinuteHand * CGFloat((60 * minutes) + seconds)
        }
    }
    
    var secondHandAngle: CGFloat {
        get {
            let cal = CalendarUtilities.utcCal()
            let seconds = cal.component(.second, from: time)
            return ωSecondHand * CGFloat(seconds)
        }
    }
    
    /// Inits a LifeClock object with the time in a Date
    ///
    /// - Parameter time: Date that contains the time to model as a clock.
    ///   If no parameter is suppled life clock is set to current time.
    init(time: Date = Date(), name: String = "") {
        self.time = time
        self.name = name
    }
}

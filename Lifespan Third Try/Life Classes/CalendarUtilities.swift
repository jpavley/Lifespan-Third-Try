//
//  CalendarUtilities.swift
//  Lifespan 2018
//
//  Created by jpavley12 on 3/3/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation

class CalendarUtilities {
    
    /// Transforms a string into a Date object.
    ///
    /// - Parameter dateString: mm-dd-yyy
    /// - Returns: Date based on mm-dd-yyy
    static func stringToDate(dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        // NOTE: Always work in UTC
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.date(from: dateString)
    }
    
    /// Transforms a string into a Date object. mm-dd-yyy doesn't matter.
    /// It's mapping a lifespan to the hands of an analog clock.
    /// See http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
    ///
    /// - Parameter dateString: hh:mm:ss
    /// - Returns: Date based on hh:mm:ss
    static func stringToTime(timeString: String) -> Time? {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        // NOTE: Always work in UTC
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let time = formatter.date(from: timeString)
        return time
    }
    
    /// Creates a calendar object based on UTC time.
    /// Calendar.current returns a calender object based in what ever
    /// time zone you're in. This function always returns a calendar
    /// object based in UTC time.
    ///
    /// - Returns: Calendar with time zone set to UTC
    static func utcCal() -> Calendar {
        var cal = Calendar.current
        cal.timeZone = TimeZone(abbreviation: "UTC")!
        return cal
    }
    
    static func thisYear() -> Float {
        let cal = CalendarUtilities.utcCal()
        let year = cal.component(.year, from: Date())
        return Float(year)
    }
}

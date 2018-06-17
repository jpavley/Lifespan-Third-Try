//
//  CalendarUtilities.swift
//  Lifespan 2018
//
//  Created by jpavley12 on 3/3/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation

class CalendarUtilities {
    
    /// Transforms a Date object into a String.
    ///
    /// - Parameter date: any valid Date object
    /// - Returns: Date string with the format MM-dd-yyyy
    static func dateToString(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "MM-dd-yyyy"
        df.timeZone = TimeZone(abbreviation: "UTC") // always work in UTC!
        return df.string(from: date)
    }
    
    /// Transforms a string into a Date object.
    ///
    /// - Parameter dateString: MM-dd-yyyy
    /// - Returns: Date based on MM-dd-yyyy
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
    
    static func thisYear() -> Int {
        let cal = CalendarUtilities.utcCal()
        let year = cal.component(.year, from: Date())
        return year
    }
    
    static func yearsFromNow(from date: Date) -> Int {
        let cal = utcCal()
        let now = Date()
        return cal.dateComponents([.year], from: date, to: now).year ?? 0
    }
    
    static func monthsFromNow(from date: Date) -> Int {
        let cal = utcCal()
        let now = Date()
        return cal.dateComponents([.month], from: date, to: now).month ?? 0
    }
    
    static func daysFromNow(from date: Date) -> Int {
        let cal = utcCal()
        let now = Date()
        return cal.dateComponents([.day], from: date, to: now).day ?? 0
    }
    
    static func days(from date1: Date, to date2: Date) -> Int {
        let cal = utcCal()
        return cal.dateComponents([.day], from: date1, to: date2).day ?? 0
    }
    
    static func monthName(from monthNumber: Int) -> String {
        guard monthNumber > 0 && monthNumber < 13 else {
            return ""
        }
        let monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        return monthNames[monthNumber - 1]
    }
    
    static func daysIn(monthNumber: Int, for year: Int) -> Int {
        guard monthNumber > 0 && monthNumber < 13 else {
            return 0
        }
        
        switch monthNumber {
        case 1,3,5,7,8,10,12:
            return 31
        case 4,6,9,11:
            return 30
        case 2:
            // a year is leap if evenly divided by 4 but not 100 or every divided by 400
            let isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)
            
            // feb has 29 days in a leap year and 28 otherwise
            return isLeapYear ? 29 : 28
       default:
            return 0 // monthNumber out of bounds
        }
    }
}

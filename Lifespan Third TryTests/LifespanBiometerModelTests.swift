//
//  LifespanBiometerModelTests.swift
//  Lifespan Third TryTests
//
//  Created by John Pavley on 6/7/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import XCTest

class LifespanBiometerModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCronologicalAge() {
        
        let lbmUT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 100)
        XCTAssertEqual(lbmUT.chronologicalAge, 100)
    }
    
    func testBiologicalAge() {
        
        let lbm1UT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 100)
        XCTAssertEqual(lbm1UT.biologicalAge, 100)
        
        let lbm2UT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 120)
        XCTAssertEqual(lbm2UT.biologicalAge.rounded(.down), 83.0)
        
        let lbm3UT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 80)
        XCTAssertEqual(lbm3UT.biologicalAge.rounded(.down), 120)
        
        let lbm4UT = LifeBioMeter(chronologicalAge: 0, ale: 0, mAle: 0)
        XCTAssertEqual(lbm4UT.biologicalAge.rounded(.down), 0)
    }
    
    func testLifeFactor() {
        
        let lbm1UT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 100)
        XCTAssertEqual(lbm1UT.lifeFactor, 1)
        
        let lbm2UT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 120)
        XCTAssertEqual(lbm2UT.lifeFactor, 100/120)
        
        let lbm3UT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 80)
        XCTAssertEqual(lbm3UT.lifeFactor, 100/80)
    }
    
    func testLifeBonus() {
        
        let lbm1UT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 100)
        XCTAssertEqual(lbm1UT.lifeBonus, 0)
        
        let lbm2UT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 120)
        XCTAssertEqual(lbm2UT.lifeBonus, 16)
        
        let lbm3UT = LifeBioMeter(chronologicalAge: 100, ale: 100, mAle: 80)
        XCTAssertEqual(lbm3UT.lifeBonus, -25)
    }
    
    func testChronAgeHandAngle() {
        
        let lbm1UT = LifeBioMeter(chronologicalAge: 120, ale: 100, mAle: 100)
        XCTAssertEqual(lbm1UT.chronAgeHandAngle, 120)
        
        let lbm2UT = LifeBioMeter(chronologicalAge: 60, ale: 100, mAle: 100)
        XCTAssertEqual(lbm2UT.chronAgeHandAngle, 0)
        
        let lbm3UT = LifeBioMeter(chronologicalAge: 0, ale: 100, mAle: 100)
        XCTAssertEqual(lbm3UT.chronAgeHandAngle, -120)
    }
    
    func testBioAgeHandAngle() {
        
        let lbm1UT = LifeBioMeter(chronologicalAge: 120, ale: 120, mAle: 120)
        XCTAssertEqual(lbm1UT.bioAgeHandAngle, 120)
        
        let lbm2UT = LifeBioMeter(chronologicalAge: 60, ale: 60, mAle: 60)
        XCTAssertEqual(lbm2UT.bioAgeHandAngle, 0)
        
        let lbm3UT = LifeBioMeter(chronologicalAge: 0, ale: 1, mAle: 1)
        XCTAssertEqual(lbm3UT.bioAgeHandAngle, -120)
    }
    
    func testDaysSpent() {
        let lbm1UT = LifeBioMeter(chronologicalAge: 120, ale: 120, mAle: 120)
        let up = UserProfile()
        
        up.setBirthDate(with: Date())
        XCTAssertEqual(lbm1UT.daysSpent(from: up.birthDate), [0, 0, 0, 0, 0, 0])
        
        up.setBirthDate(with: CalendarUtilities.stringToDate(dateString: "02-13-1961")!)
        XCTAssertEqual(lbm1UT.daysSpent(from: up.birthDate, to: CalendarUtilities.stringToDate(dateString: "06-07-2018")!), [0, 2, 0, 9, 3, 3])
        XCTAssertEqual(lbm1UT.daysSpent(from: up.birthDate, to: CalendarUtilities.stringToDate(dateString: "02-14-1961")!), [0, 0, 0, 0, 0, 1])
    }

    
    
}















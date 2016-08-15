//
//  NSDateTests.swift
//  Taylor
//
//  Created by Luc Dion on 2016-07-11.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit
import XCTest
import Taylor

class NSDateTests: XCTestCase {

    func testEarlierAndLater() {
        let now = NSDate()
        let laterDate = NSDate(timeIntervalSinceNow: 1000)
        let earlierDate = NSDate(timeIntervalSince1970: 1)
        XCTAssertTrue(laterDate.isLater(than: now))
        XCTAssertTrue(earlierDate.isEarlier(than: now))

        XCTAssertFalse(now.isLater(than: now))
        XCTAssertFalse(now.isEarlier(than: now))


        // Test unitGranularity
        let oneDayLaterDate = now.addDaysToDate(1)
        // Is at least one DAY later?
        XCTAssertTrue(oneDayLaterDate.isLater(than: now, unitGranularity: .Day))
        // Is at least one MONTH later?
        XCTAssertFalse(oneDayLaterDate.isLater(than: now, unitGranularity: .Month))
        // Is at least one YEAR later?
        XCTAssertFalse(oneDayLaterDate.isLater(than: now, unitGranularity: .Year))

        let oneDayEarlierDate = now.addDaysToDate(-1)
        // Is at least one DAY earlier?
        XCTAssertTrue(oneDayEarlierDate.isEarlier(than: now, unitGranularity: .Day))
        // Is at least one MONTH earlier?
        XCTAssertFalse(oneDayEarlierDate.isEarlier(than: now, unitGranularity: .Month))
        // Is at least one YEAR earlier?
        XCTAssertFalse(oneDayEarlierDate.isEarlier(than: now, unitGranularity: .Year))


        // isEqual
        XCTAssertTrue(now.isEqual(now))
        // Is same DAY?
        XCTAssertFalse(oneDayLaterDate.isEqual(to: now, unitGranularity: .Day))
        // Is same MONTH?
        XCTAssertTrue(oneDayLaterDate.isEqual(to: now, unitGranularity: .Month))
        // Is same YEAR?
        XCTAssertTrue(oneDayLaterDate.isEqual(to: now, unitGranularity: .Year))
    }
}

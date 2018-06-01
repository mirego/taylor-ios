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
        let referenceDate = Date(timeIntervalSince1970: 200 * 24 * 60 * 60)
        let laterDate = Date(timeInterval: 100, since: referenceDate)
        let earlierDate = Date(timeInterval: -100, since: referenceDate)
        XCTAssertTrue(laterDate.isLater(than: referenceDate))
        XCTAssertTrue(earlierDate.isEarlier(than: referenceDate))

        XCTAssertFalse(referenceDate.isLater(than: referenceDate))
        XCTAssertFalse(referenceDate.isEarlier(than: referenceDate))

        // Test unitGranularity
        let oneDayLaterDate = referenceDate.addDaysToDate(1)
        // Is at least one DAY later?
        XCTAssertTrue(oneDayLaterDate.isLater(than: referenceDate, unitGranularity: .day))
        // Is at least one MONTH later?
        XCTAssertFalse(oneDayLaterDate.isLater(than: referenceDate, unitGranularity: .month))
        // Is at least one YEAR later?
        XCTAssertFalse(oneDayLaterDate.isLater(than: referenceDate, unitGranularity: .year))

        let oneDayEarlierDate = referenceDate.addDaysToDate(-1)
        // Is at least one DAY earlier?
        XCTAssertTrue(oneDayEarlierDate.isEarlier(than: referenceDate, unitGranularity: .day))
        // Is at least one MONTH earlier?
        XCTAssertFalse(oneDayEarlierDate.isEarlier(than: referenceDate, unitGranularity: .month))
        // Is at least one YEAR earlier?
        XCTAssertFalse(oneDayEarlierDate.isEarlier(than: referenceDate, unitGranularity: .year))

        // isEqual
        XCTAssertTrue(referenceDate == referenceDate)
        // Is same DAY?
        XCTAssertFalse(oneDayLaterDate.isEqual(to: referenceDate, unitGranularity: .day))
        // Is same MONTH?
        XCTAssertTrue(oneDayLaterDate.isEqual(to: referenceDate, unitGranularity: .month))
        // Is same YEAR?
        XCTAssertTrue(oneDayLaterDate.isEqual(to: referenceDate, unitGranularity: .year))
    }
}

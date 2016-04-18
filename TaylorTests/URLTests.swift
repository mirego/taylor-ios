//
//  URLTests.swift
//  Taylor
//
//  Created by Romain Pouclet on 2016-04-15.
//  Copyright © 2016 Mirego. All rights reserved.
//

import XCTest
import func Taylor.cleanURLForDisplay

class URLTests: XCTestCase {

    func testURLIsProperlyCleaned() {
        XCTAssertEqual("superfilm.com/marvel/deadpool", cleanURLForDisplay(NSURL(string: "http://www.superfilm.com/marvel/deadpool?fun=1")!))
    }

}

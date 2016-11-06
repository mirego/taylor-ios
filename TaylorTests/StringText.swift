//
//  StringTest.swift
//  Taylor
//
//  Created by Luc Dion on 2016-11-11.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit
import XCTest
import Taylor

class StringTest: XCTestCase {

    func testTrim() {
        let trimmedString = "This is a string"
        let stringWithSpaces = "\t \(trimmedString) \t  "
        var string = String(stringWithSpaces)!

        XCTAssertEqual(string.trimmed, trimmedString)
        // Should not mutate the string
        XCTAssertEqual(string, stringWithSpaces)

        // Should mutate the string
        string.trim()
        XCTAssertEqual(string, trimmedString)
    }

    func testCapitalizeFirstLetter() {
        let capitalizedString = "Capitalize first letter only"
        var string = "capitalize first letter only"

        XCTAssertEqual(string.capitalizedFirstLetterOnly, capitalizedString)
        // Should not mutate the string
        XCTAssertEqual(string, "capitalize first letter only")

        // Should mutate the string
        string.capitalizeFirstLetterOnly()
        XCTAssertEqual(string, capitalizedString)
    }
}

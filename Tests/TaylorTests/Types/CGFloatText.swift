//
//  CGFloatTest.swift
//  Taylor
//
//  Created by Luc Dion on 2016-11-11.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit
import XCTest
import Taylor

class CGFloatTest: XCTestCase {

    func testMax() {
        XCTAssertEqual(CGFloat.max, CGFloat.greatestFiniteMagnitude)
    }
}

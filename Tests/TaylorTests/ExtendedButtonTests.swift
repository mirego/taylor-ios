//
//  ExtendedButtonTests.swift
//  Taylor
//
//  Created by Romain Pouclet on 2016-04-14.
//  Copyright © 2016 Mirego. All rights reserved.
//

import XCTest
import UIKit
import class Taylor.ExtendedButton

class ExtendedButtonTests: XCTestCase {

    func testHitAreaIsExtended() {
        let button = ExtendedButton()
        button.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 10, height: 10))

        XCTAssertTrue(button.point(inside: CGPoint(x: 20, y: 20), with: nil))
    }

}

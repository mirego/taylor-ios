//
//  UIEdgeInsetsTests.swift
//  Taylor
//
//  Created by Romain Pouclet on 2016-03-30.
//  Copyright © 2016 Mirego. All rights reserved.
//

import XCTest
import Taylor

class UIEdgeInsetsTests: XCTestCase {
    

    func testShortcutsReturnsAValidInset() {
        XCTAssertEqual(UIEdgeInsets.top(5), UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0))
        XCTAssertEqual(UIEdgeInsets.left(5), UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0))
        XCTAssertEqual(UIEdgeInsets.right(5), UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5))
        XCTAssertEqual(UIEdgeInsets.bottom(5), UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0))
        XCTAssertEqual(UIEdgeInsets.margins(5), UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        XCTAssertEqual(UIEdgeInsets.zero, UIEdgeInsetsZero)
    }
    
}

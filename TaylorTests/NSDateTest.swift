//
//  TextLabelTests.swift
//  Taylor
//
//  Created by Luc Dion on 2016-05-11.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit
import XCTest
import Taylor

class LabelTests: XCTestCase {

    func testSizeThatFits() {
        let text = "A very very very long string that is wider than the specified width"
        let sizeFits = CGSize(width: 40, height: .max)

        let singleLineTextLabel = Label()
        singleLineTextLabel.text = text

        let singleLineTextLabelSize = singleLineTextLabel.sizeThatFits(sizeFits)
        XCTAssertLessThanOrEqual(singleLineTextLabelSize.width, sizeFits.width)


        let multiLineTextLabel = Label()
        multiLineTextLabel.numberOfLines = 0
        multiLineTextLabel.lineBreakMode = .ByWordWrapping
        multiLineTextLabel.text = text

        let multiLineTextLabelSize = multiLineTextLabel.sizeThatFits(sizeFits)
        XCTAssertLessThanOrEqual(multiLineTextLabelSize.width, sizeFits.width)
    }
}

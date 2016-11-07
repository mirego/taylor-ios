//
//  UIButtonTest.swift
//  Taylor
//
//  Created by Luc Dion on 2016-05-11.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit
import XCTest
import Taylor

class UIButtonTest: XCTestCase {

    func testSetProperties() {
        let button = UIButton()
        let text = "hello"
        let font = UIFont.boldSystemFont(ofSize: 10)
        let textAlignment = NSTextAlignment.center
        let backgroundColor = UIColor.purple

        button.setProperties(text: text, font: font, normalTextColor: .blue, highlightedTextColor: .red, selectedTextColor: .green, disabledTextColor: .gray, textAlignment: textAlignment, backgroundColor: backgroundColor, fit: true)

        XCTAssertEqual(button.titleLabel!.text, text)
        XCTAssertEqual(button.titleLabel!.font.pointSize, font.pointSize)
        XCTAssertEqual(button.titleLabel!.textAlignment, textAlignment)
        XCTAssertEqual(button.backgroundColor, backgroundColor)

        let buttonTextOnly = UIButton()
        buttonTextOnly.setProperties(text: text)
        XCTAssertEqual(buttonTextOnly.titleLabel!.text, text)

        let buttonFontOnly = UIButton()
        buttonFontOnly.setProperties(font: font)
        XCTAssertEqual(buttonFontOnly.titleLabel!.font.pointSize, font.pointSize)

        let buttonAlignmentOnly = UIButton()
        buttonAlignmentOnly.setProperties(textAlignment: textAlignment)
        XCTAssertEqual(buttonAlignmentOnly.titleLabel!.textAlignment, textAlignment)

        let buttonBackgroundColorOnly = UIButton()
        buttonBackgroundColorOnly.setProperties(backgroundColor: backgroundColor)
        XCTAssertEqual(button.backgroundColor, backgroundColor)

        let buttonWithoutFit = UIButton()
        buttonWithoutFit.setProperties(text: text)
        let buttonWithFit = UIButton()
        buttonWithFit.setProperties(text: text, fit: true)
        XCTAssertNotEqual(buttonWithoutFit.frame.width, buttonWithFit.frame.width)
    }

    func testSetImages() {
        let image = UIImage.imageWithTintColor(UIColor.blue)

        let buttonWithoutFit = UIButton()
        buttonWithoutFit.setImages(image!, normalColor: .blue, highlightedColor: .red, selectedColor: .green, disabledColor: .gray)
        let buttonWithFit = UIButton()
        buttonWithFit.setImages(image!, normalColor: .blue, highlightedColor: .red, selectedColor: .green, disabledColor: .gray, fit: true)
        XCTAssertNotEqual(buttonWithoutFit.frame.width, buttonWithFit.frame.width)
    }
}

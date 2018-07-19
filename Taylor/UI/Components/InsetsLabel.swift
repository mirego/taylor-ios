//
//  InsetsLabel.swift
//  Taylor
//
//  Created by Olivier Pineau on 2018-07-19.
//  Copyright © 2018 Mirego. All rights reserved.
//

import Foundation

open class InsetsLabel: UILabel {
    public var contentEdgeInsets: UIEdgeInsets = .zero {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }

    override open var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height += contentEdgeInsets.top + contentEdgeInsets.bottom
        return size
    }

    override open func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, contentEdgeInsets))
    }

    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        let baseSize = super.sizeThatFits(size)
        return CGSize(width: size.width, height: baseSize.height + contentEdgeInsets.top + contentEdgeInsets.bottom)
    }
}

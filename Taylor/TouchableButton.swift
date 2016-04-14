//
//  TouchableButton.swift
//  Taylor
//
//  Created by Hugo Lefrancois on 2015-08-24.
//  Copyright (c) 2015 Mirego. All rights reserved.
//

import UIKit

public class TouchableButton: UIButton
{
    var minimalTapableSize = CGSize.minimalTapableSize()

    override public func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool
    {
        let yOffset: CGFloat = max(0, minimalTapableSize.width - frame.height)
        let xOffset: CGFloat = max(0, minimalTapableSize.height - frame.width)
        if(yOffset > 0 || xOffset > 0)
        {
            return bounds.insetBy(dx: -xOffset / 2, dy: -yOffset / 2).contains(point)
        }
        else
        {
            return super.pointInside(point, withEvent: event)
        }
    }
}

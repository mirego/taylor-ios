//
//  UIEdgeInsets.swift
//  Taylor
//
//  Created by Romain Pouclet on 2016-03-30.
//  Copyright © 2016 Mirego. All rights reserved.
//

import Foundation

public extension UIEdgeInsets
{
    static public var zero: UIEdgeInsets { return UIEdgeInsetsZero }

    static public func top(margin: CGFloat) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: margin, left: 0, bottom: 0, right: 0)
    }

    static public func left(margin: CGFloat) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: margin, bottom: 0, right: 0)
    }

    static public func bottom(margin: CGFloat) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: margin, right: 0)
    }

    static public func right(margin: CGFloat) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: margin)
    }
}
//
//  Geometry.swift
//  Taylor
//
//  Created by Romain Pouclet on 2015-12-09.
//  Copyright © 2015 Mirego. All rights reserved.
//

import Foundation

public extension UIEdgeInsets
{
    static var zero: UIEdgeInsets { return UIEdgeInsetsZero }
    
    static func top(margin: CGFloat) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: margin, left: 0, bottom: 0, right: 0)
    }
    
    static func left(margin: CGFloat) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: margin, bottom: 0, right: 0)
    }
    
    static func bottom(margin: CGFloat) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: margin, right: 0)
    }
    
    static func right(margin: CGFloat) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: margin)
    }
}
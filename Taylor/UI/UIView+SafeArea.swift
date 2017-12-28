//
//  UIView+SafeArea.swift
//  Taylor
//
//  Created by Antoine Lamy on 2017-12-28.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import ObjectiveC

@available(iOS 7.0, *)
public protocol IgnoreNewerSafeAreaInsets {}

@available(iOS 7.0, *)
public protocol CompatibilitySafeAreaInsetsUpdate {
    func compatibilitySafeAreaInsetsDidChange()
}

public extension UIViewController {
    @available(iOS 7.0, *)
    class func enableCompatibilitySafeAreaInsets() {
        guard self === UIViewController.self else { return }
        swizzleMethod(self, #selector(UIViewController.viewWillLayoutSubviews), #selector(UIViewController.swizzled_viewWillLayoutSubviews))
    }

    @objc private func swizzled_viewWillLayoutSubviews() {
        self.swizzled_viewWillLayoutSubviews()
        if #available(iOS 11.0, *), !(self is IgnoreNewerSafeAreaInsets) {
            // Do nothing, let the iOS 11+ safeAreaInsets mecanism do his thing
        } else {
            let safeAreaInsets: UIEdgeInsets
            if #available(iOS 11.0, *) {
                safeAreaInsets = UIEdgeInsets(top: topLayoutGuide.length, left: additionalSafeAreaInsets.left, bottom: bottomLayoutGuide.length, right: additionalSafeAreaInsets.right)
            } else {
                safeAreaInsets = UIEdgeInsets(top: topLayoutGuide.length, left: 0, bottom: bottomLayoutGuide.length, right: 0)
            }
            view.assignSafeAreaInsetsRecursively(insets: safeAreaInsets)
        }
    }
}

extension UIView {
    private struct AssociatedKeys {
        static var compatibilitySafeAreaInsets = UnsafeMutablePointer<Int8>.allocate(capacity: 1)
    }

    @available(iOS 7.0, *)
    public private(set) var compatibilitySafeAreaInsets: UIEdgeInsets {
        get {
            if #available(iOS 11.0, *), !(self is IgnoreNewerSafeAreaInsets) {
                return safeAreaInsets
            } else {
                return objc_getAssociatedObject(self, &AssociatedKeys.compatibilitySafeAreaInsets) as? UIEdgeInsets ?? UIEdgeInsets.zero
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.compatibilitySafeAreaInsets, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    fileprivate func assignSafeAreaInsetsRecursively(insets: UIEdgeInsets) {
        let didChange: Bool = compatibilitySafeAreaInsets != insets
        compatibilitySafeAreaInsets = insets
        if didChange {
            if let updatable = self as? CompatibilitySafeAreaInsetsUpdate {
                updatable.compatibilitySafeAreaInsetsDidChange()
            }
        }

        for subview in subviews {
            let topSafeInsetValue = max(insets.top - subview.frame.origin.y, 0)
            let leftSafeInsetValue = max(insets.left - subview.frame.origin.x, 0)
            let bottomSafeInsetValue = max((subview.frame.origin.y + subview.frame.size.height) - bounds.size.height - insets.bottom, 0)
            let rightSafeInsetValue = max((subview.frame.origin.x + subview.frame.size.width) - bounds.size.width - insets.right, 0)
            let subviewSafeAreaInsets = UIEdgeInsets(top: topSafeInsetValue, left: leftSafeInsetValue, bottom: bottomSafeInsetValue, right: rightSafeInsetValue)
            if subviewSafeAreaInsets != UIEdgeInsets.zero {
                subview.assignSafeAreaInsetsRecursively(insets: subviewSafeAreaInsets)
            }
        }
    }
}

private let swizzleMethod: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    if let originalMethod = class_getInstanceMethod(forClass, originalSelector),
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector) {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}

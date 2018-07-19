// Copyright (c) 2016, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

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
        if #available(iOS 11.0, tvOS 11, *), !(self is IgnoreNewerSafeAreaInsets) {
            // Do nothing, let the iOS 11+ safeAreaInsets mecanism do his thing
        } else {
            let safeAreaInsets: UIEdgeInsets
            if #available(iOS 11.0, tvOS 11, *) {
                safeAreaInsets = UIEdgeInsets(top: topLayoutGuide.length, left: additionalSafeAreaInsets.left, bottom: bottomLayoutGuide.length, right: additionalSafeAreaInsets.right)
            } else {
                safeAreaInsets = UIEdgeInsets(top: topLayoutGuide.length, left: 0, bottom: bottomLayoutGuide.length, right: 0)
            }
            view.assignSafeAreaInsetsRecursively(insets: safeAreaInsets)
        }
    }
}

public extension UIView {
    private struct AssociatedKeys {
        static var compatibilitySafeAreaInsets = UnsafeMutablePointer<Int8>.allocate(capacity: 1)
    }

    @available(iOS 7.0, *)
    public private(set) var compatibilitySafeAreaInsets: UIEdgeInsets {
        get {
            if #available(iOS 11.0, tvOS 11, *), !(self is IgnoreNewerSafeAreaInsets) {
                return safeAreaInsets
            } else {
                return objc_getAssociatedObject(self, &AssociatedKeys.compatibilitySafeAreaInsets) as? UIEdgeInsets ?? UIEdgeInsets.zero
            }
        }
        set {
            let didChange: Bool = compatibilitySafeAreaInsets != newValue
            objc_setAssociatedObject(self, &AssociatedKeys.compatibilitySafeAreaInsets, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if didChange, let updatable = self as? CompatibilitySafeAreaInsetsUpdate {
                updatable.compatibilitySafeAreaInsetsDidChange()
            }
        }
    }

    fileprivate func assignSafeAreaInsetsRecursively(insets: UIEdgeInsets) {
        compatibilitySafeAreaInsets = insets
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

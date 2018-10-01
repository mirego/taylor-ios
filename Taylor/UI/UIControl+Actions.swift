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

private class ActionTrampoline<T>: NSObject {
    private let action: (T) -> Void

    init(action: @escaping (T) -> Void) {
        self.action = action
    }

    @objc func performAction(sender: UIControl) {
        action(sender as! T)
    }
}

private var UIControlActionAssociatedObjectKeys: [UInt: UnsafeMutablePointer<Int8>] = [:]

public protocol UIControlActionFunctionProtocol {}
extension UIControl: UIControlActionFunctionProtocol {}

public extension UIControlActionFunctionProtocol where Self: UIControl {
    public func addAction(events: UIControl.Event, _ action: @escaping (Self)  -> Void) {
        let trampoline = ActionTrampoline(action: action)
        addTarget(trampoline, action: #selector(trampoline.performAction(sender:)), for: events)
        objc_setAssociatedObject(self, actionKey(forEvents: events), trampoline, .OBJC_ASSOCIATION_RETAIN)
    }

    private func actionKey(forEvents events: UIControl.Event) -> UnsafeMutablePointer<Int8> {
        if let key = UIControlActionAssociatedObjectKeys[events.rawValue] {
            return key
        } else {
            let key = UnsafeMutablePointer<Int8>.allocate(capacity: 1)
            UIControlActionAssociatedObjectKeys[events.rawValue] = key
            return key
        }
    }
}

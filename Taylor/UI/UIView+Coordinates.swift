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

/**
 * Simplified syntax for reading/writing UIView coordinates:
 - width: CGFloat     [read-write]
 - height: CGFloat    [read-write]
 - size: CGSize       [read-write]
 - origin: CGPoint    [read-write]
 - x: CGFloat         [read-write]
 - y: CGFloat         [read-write]
 - maxX: CGFloat      [read]
 - maxY: CGFloat      [read]
 - minX: CGFloat      [read]
 - minY: CGFloat      [read]
 - midX: CGFloat      [read]
 - midY: CGFloat      [read]

 Examples:
 subview.size = view.size
 subview.width = view.width
 */
// swiftlint:disable variable_name
public extension UIView {
    public var width: CGFloat {
        set {
            bounds.size.width = newValue
        }
        get {
            return bounds.width
        }
    }

    public var height: CGFloat {
        set {
            bounds.size.height = newValue
        }
        get {
            return bounds.height
        }
    }

    public var size: CGSize {
        set {
            bounds.size = newValue
        }
        get {
            return bounds.size
        }
    }

    public var origin: CGPoint {
        set {
            frame.origin = newValue
        }
        get {
            return frame.origin
        }
    }

    public var x: CGFloat {
        set {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }

    public var y: CGFloat {
        set {
            frame.origin.y = newValue
        }
        get {
            return frame.origin.y
        }
    }

    public var maxX: CGFloat {
        return frame.maxX
    }

    public var maxY: CGFloat {
        return frame.maxY
    }

    public var minX: CGFloat {
        return frame.minX
    }

    public var minY: CGFloat {
        return frame.minY
    }

    public var midX: CGFloat {
        return frame.midX
    }

    public var midY: CGFloat {
        return frame.midY
    }
}
// swiftlint:enable variable_name

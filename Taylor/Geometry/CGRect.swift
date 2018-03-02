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

import Foundation

// swiftlint:disable variable_name

public extension CGRect
{
    /// Expose the x origin of the `CGRect`
    public var x: CGFloat {
        set {
            origin.x = newValue
        }

        get {
            return origin.x
        }
    }

    /// Expose the y origin of the `CGRect`
    public var y: CGFloat {
        set {
            origin.y = newValue
        }

        get {
            return origin.y
        }
    }

    mutating func roundSize() {
        size.round()
    }

    mutating func floorSize() {
        size.floor()
    }

    mutating func ceilSize() {
        size.ceil()
    }

    mutating func roundOrigin() {
        origin.round()
    }

    mutating func floorOrigin() {
        origin.floor()
    }

    mutating func ceilOrigin() {
        origin.ceil()
    }
}

// swiftlint:enable variable_name

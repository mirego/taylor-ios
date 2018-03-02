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

func + (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width + right.width, height: left.height + right.height)
}

func += (left: inout CGSize, right: CGSize) {
    left = left + right
}

public extension CGSize
{
    @available(*, deprecated, message: "This function was not performing an inset operation but had the effect of adding values to its components, you should use the + operator on two CGSize as a direct replacement. To perform a real inset operation, use insetBy provided by CoreGraphics.")
    public func inset(_ xOffset: CGFloat, yOffset: CGFloat) -> CGSize {
        return CGSize(width: self.width + xOffset, height: self.height + yOffset)
    }

    @available(*, deprecated, message: "Use scaleBy instead of this function, its naming is more in line with naming conventions.")
    public func scale(_ xOffset: CGFloat, yOffset: CGFloat) -> CGSize {
        return CGSize(width: self.width * xOffset, height: self.height * yOffset)
    }

    public func scaleBy(sx: CGFloat, sy: CGFloat) -> CGSize {
        return CGSize(width: self.width * sx, height: self.height * sy)
    }

    public mutating func round() {
        width = Darwin.round(width)
        height = Darwin.round(height)
    }

    public func rounded() -> CGSize {
        return CGSize(width: Darwin.round(width), height: Darwin.round(height))
    }

    public mutating func floor() {
        width = Darwin.floor(width)
        height = Darwin.floor(height)
    }

    public func floored() -> CGSize {
        return CGSize(width: Darwin.floor(width), height: Darwin.floor(height))
    }

    public mutating func ceil() {
        width = Darwin.ceil(width)
        height = Darwin.ceil(height)
    }

    public func ceiled() -> CGSize {
        return CGSize(width: Darwin.ceil(width), height: Darwin.ceil(height))
    }

    static public func minimalTapableSize() -> CGSize {
        return CGSize(width: 44, height: 44)
    }
}

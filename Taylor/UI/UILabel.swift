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

public extension UILabel
{
    /**
     Set multiple UILabel's properties. All parameters are optionals

     - parameter text:                 Optional text value. (Default is nil)
     - parameter font:                 Optional font value. (Default is nil)
     - parameter textColor:            Optional text color. (Default is nil)
     - parameter highlightedTextColor: Optional highlighted text color. (Default is nil)
     - parameter lineSpacing:          Optional line spacing. (Default is nil)
     - parameter textAlignment:        Optional text alignment value. (Default is nil)
     - parameter fit:                  Optional boolean that indicate if the button's method sizeToFit should be called. (Default is false)
     - parameter multiline:            Optional boolean that indicate if label is multiline. (Default is nil)
     */
    public func setProperties(text: String? = nil, font: UIFont? = nil, textColor: UIColor? = nil, highlightedTextColor: UIColor? = nil, lineSpacing: CGFloat? = nil, textAlignment: NSTextAlignment? = nil, fit: Bool = false, multiline: Bool? = nil)
    {
        if let text = text {
            if let lineSpacing = lineSpacing {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = lineSpacing
                if let textAlignment = textAlignment {
                    paragraphStyle.alignment = textAlignment
                }
                paragraphStyle.lineBreakMode = .byTruncatingTail
                attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            } else {
                self.text = text
            }
        }

        if let font = font {
            self.font = font
        }

        if let textColor = textColor {
            self.textColor = textColor
        }

        if let highlightedTextColor = highlightedTextColor {
            self.highlightedTextColor = highlightedTextColor
        }

        if let textAlignment = textAlignment {
            self.textAlignment = textAlignment
        }

        if let multiline = multiline {
            numberOfLines = multiline ? 0 : 1
            lineBreakMode = multiline ? .byWordWrapping : .byTruncatingTail
        }

        if fit {
            sizeToFit()
        }
    }

    public func setAttributedText(_ text: NSAttributedString?, fit: Bool = false)
    {
        attributedText = text

        if fit {
            sizeToFit()
        }
    }
}

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


extension UIButton
{
    /**
     Set multiple UIButton's properties. All parameters are optionnals:
     - text
     - font
     - text colors (Normal, Hightlighted, Selected, Disabled)
     - text alignment
     - backgroundColor

     and also optionnaly calls sizeToFit() to adjust the button's size.
     */
    public func setProperties(text text: String? = nil, font: UIFont? = nil,
                            normalTextColor: UIColor? = nil, highlightedTextColor: UIColor? = nil, selectedTextColor: UIColor? = nil, disabledTextColor: UIColor? = nil,
                            textAlignment: NSTextAlignment? = nil, backgroundColor: UIColor? = nil, fit: Bool = false)
    {
        if let font = font {
            titleLabel?.setProperties(font: font, textAlignment: textAlignment)
        }

        if let text = text {
            setTitle(text, forState: .Normal)
        }

        if let normalTextColor = normalTextColor {
            setTitleColor(normalTextColor, forState: .Normal)
        }

        if let highlightedTextColor = highlightedTextColor {
            setTitleColor(highlightedTextColor, forState: .Highlighted)
        }

        if let selectedTextColor = selectedTextColor {
            setTitleColor(selectedTextColor, forState: .Selected)
        }

        if let disabledTextColor = disabledTextColor {
            setTitleColor(disabledTextColor, forState: .Disabled)
        }

        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }

        if fit {
            sizeToFit()
        }
    }

    public func setImages(image: UIImage, normalColor: UIColor? = nil, highlightedColor: UIColor? = nil, selectedColor: UIColor? = nil, disabledColor: UIColor? = nil,
                          fit: Bool = false)
    {
        if let normalColor = normalColor {
            setImage(image.imageWithTintColor(normalColor), forState: .Normal)
        } else {
            setImage(image, forState: .Normal)
        }

        if let highlightedColor = highlightedColor {
            setImage(image.imageWithTintColor(highlightedColor), forState: .Highlighted)
        }

        if let selectedColor = selectedColor {
            setImage(image.imageWithTintColor(selectedColor), forState: .Selected)
        }

        if let disabledColor = disabledColor {
            setImage(image.imageWithTintColor(disabledColor), forState: .Disabled)
        }
    }

    /**
     Set the UIButton image and call sizeToFit() to adjust the button size.
     */
    public func setImageAndFit(image: UIImage?, forState state: UIControlState)
    {
        setImage(image, forState: state)
        sizeToFit()
    }
}

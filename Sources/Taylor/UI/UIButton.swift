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
    /// Set multiple UIButton's properties. All parameters are optionals.
    /// parameter text:                 Optional text value. (Default is nil)
    /// parameter font:                 Optional font value. (Default is nil)
    /// parameter normalTextColor:      Optional NORMAL text color. (Default is nil)
    /// parameter highlightedTextColor: Optional HIGHLIGHTED text color. (Default is nil)
    /// parameter selectedTextColor:    Optional SELECTED text color. (Default is nil)
    /// parameter disabledTextColor:    Optional DISABLED text color. (Default is nil)
    /// parameter textAlignment:        Optional text alignment value. (Default is nil)
    /// parameter backgroundColor:      Optional background color. (Default is nil)
    /// parameter fit:                  Optional boolean that indicate if the button's method sizeToFit should be called. (Default is false)
    public func setProperties(text: String? = nil, font: UIFont? = nil,
                            normalTextColor: UIColor? = nil, highlightedTextColor: UIColor? = nil, selectedTextColor: UIColor? = nil, disabledTextColor: UIColor? = nil,
                            textAlignment: NSTextAlignment? = nil, backgroundColor: UIColor? = nil, fit: Bool = false)
    {
        if let text = text {
            setTitle(text, for: UIControl.State())
        }

        if let font = font {
            titleLabel?.font = font
        }

        if let normalTextColor = normalTextColor {
            setTitleColor(normalTextColor, for: UIControl.State())
        }

        if let highlightedTextColor = highlightedTextColor {
            setTitleColor(highlightedTextColor, for: .highlighted)
        }

        if let selectedTextColor = selectedTextColor {
            setTitleColor(selectedTextColor, for: .selected)
        }

        if let disabledTextColor = disabledTextColor {
            setTitleColor(disabledTextColor, for: .disabled)
        }
        
        if let textAlignment = textAlignment {
            titleLabel?.textAlignment = textAlignment
        }

        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }

        if fit {
            sizeToFit()
        }
    }

    /// Set the button's image for its normal state and optionally the tint color of all its states (normal, highlighted, selected and disabled).
    /// Useful if the button used the same image for all its states but with a different tint color for each state.
    /// parameter image:            Button's image
    /// parameter normalColor:      Optional NORMAL state tint color. If not value is specified, the image well keep its current color. (Default is nil)
    /// parameter highlightedColor: Optional HIGHLIGHTED state tint color. (Default is nil)
    /// parameter selectedColor:    Optional SELECTED state tint color. (Default is nil)
    /// parameter disabledColor:    Optional DISABLED state tint color. (Default is nil)
    /// parameter fit:              Optional boolean that indicate if the button's method sizeToFit should be called. (Default is false)
    public func setImages(_ image: UIImage, normalColor: UIColor? = nil, highlightedColor: UIColor? = nil, selectedColor: UIColor? = nil, disabledColor: UIColor? = nil,
                          fit: Bool = false)
    {
        if let normalColor = normalColor {
            setImage(image.imageWithTintColor(normalColor), for: UIControl.State())
        } else {
            setImage(image, for: UIControl.State())
        }

        if let highlightedColor = highlightedColor {
            setImage(image.imageWithTintColor(highlightedColor), for: .highlighted)
        }

        if let selectedColor = selectedColor {
            setImage(image.imageWithTintColor(selectedColor), for: .selected)
        }

        if let disabledColor = disabledColor {
            setImage(image.imageWithTintColor(disabledColor), for: .disabled)
        }

        if fit {
            sizeToFit()
        }
    }

    /// Set the UIButton image and call sizeToFit() to adjust the button size.
    /// parameter image: New button's image
    /// parameter state: The state for which this image must be set.
    public func setImageAndFit(_ image: UIImage?, forState state: UIControl.State)
    {
        setImage(image, for: state)
        sizeToFit()
    }

    /**
     Sets the background color to use for the specified button state.

     - parameter color: The background color to use for the specified state
     - parameter state: The state that uses the specified image. The values are described in UIControlState
     */
    public func setBackgroundColor(_ color: UIColor?, for state: UIControl.State) {
        setBackgroundImage(UIImage.image(from: color), for: state)
    }
}

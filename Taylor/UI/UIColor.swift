/// Copyright (c) 2016, Mirego
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

extension UIColor
{
    /// Create color from hexadecimal value with optional transparency.
    /// parameter absoluteRed:          amount of red (between 0 and 255)
    /// parameter absoluteGreen:        amount of green (between 0 and 255)
    /// parameter absoluteBlue:         amount of blue (between 0 and 255)
    /// parameter alpha:                optional alpha value (default is 1)
    public convenience init?(absoluteRed: Int, absoluteGreen: Int, absoluteBlue: Int, alpha: CGFloat = 1) {
        guard absoluteRed >= 0 && absoluteRed <= 255 else { return nil }
        guard absoluteGreen >= 0 && absoluteGreen <= 255 else { return nil }
        guard absoluteBlue >= 0 && absoluteBlue <= 255 else { return nil }

        var alpha = alpha
        if alpha < 0 { alpha = 0 }
        if alpha > 1 { alpha = 1 }

        self.init(red: CGFloat(absoluteRed) / 255.0, green: CGFloat(absoluteGreen) / 255.0, blue: CGFloat(absoluteBlue) / 255.0, alpha: alpha)
    }

    /// Create color from hexadecimal value with optional transparency.
    /// parameter hex:          hex Int (example: 0xDECEB5).
    /// parameter alpha:        optional alpha value (default is 1)
    public convenience init?(hex: Int, alpha: CGFloat = 1) {
        var alpha = alpha
        if alpha < 0 { alpha = 0 }
        if alpha > 1 { alpha = 1 }

        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff

        self.init(absoluteRed: red, absoluteGreen: green, absoluteBlue: blue, alpha: alpha)
    }

    /// Create Color from hexadecimal string with optional transparency (if applicable).
    /// parameter hexString:    hexadecimal string (examples: EDE7F6, 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..).
    /// parameter alpha:        optional alpha value (default is 1)
    public convenience init?(hexString: String, alpha: CGFloat = 1) {
        var string = ""
        if hexString.lowercased().hasPrefix("0x") {
            string =  hexString.replacingOccurrences(of: "0x", with: "")
        } else if hexString.hasPrefix("#") {
            string = hexString.replacingOccurrences(of: "#", with: "")
        } else {
            string = hexString
        }

        if string.count == 3 { // convert hex to 6 digit format if in short format
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }

        guard let hexValue = Int(string, radix: 16) else { return nil }

        self.init(hex: hexValue, alpha: alpha)
    }

    static public func colorBetweenColors(startColor: UIColor, endColor: UIColor, percentage: CGFloat) -> UIColor {
        if percentage <= 0 {
            return startColor
        } else if percentage >= 1 {
            return endColor
        }

        var startRed: CGFloat = 0
        var startGreen: CGFloat = 0
        var startBlue: CGFloat = 0
        var startAlpha: CGFloat = 0
        startColor.getRed(&startRed, green: &startGreen, blue: &startBlue, alpha: &startAlpha)

        var endRed: CGFloat = 0
        var endGreen: CGFloat = 0
        var endBlue: CGFloat = 0
        var endAlpha: CGFloat = 0
        endColor.getRed(&endRed, green: &endGreen, blue: &endBlue, alpha: &endAlpha)

        let middleRed = CGFloat(startRed + (percentage * (endRed - startRed)))
        let middleGreen = CGFloat(startGreen + (percentage * (endGreen - startGreen)))
        let middleBlue = CGFloat(startBlue + (percentage * (endBlue - startBlue)))
        let middleAlpha = CGFloat(startAlpha + (percentage * (endAlpha - startAlpha)))

        return UIColor(red: middleRed, green: middleGreen, blue: middleBlue, alpha: middleAlpha)
    }
}

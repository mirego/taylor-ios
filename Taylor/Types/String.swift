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

public extension String
{
    /// Checks if the string matches the specified regular expression.
    /// parameter regExp:        Regular expression
    /// parameter caseSensitive: Specify if the comparison must be case sensitive (Default is true).
    /// returns: true if the string matches the specified regular expression
    public func matches(_ regExp: String, caseSensitive: Bool = true) -> Bool
    {
        do {
            let regex = try NSRegularExpression(pattern:regExp, options: caseSensitive ? [] : .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: count)) != nil
        } catch {
            return false
        }
    }

    /// Checks if the string contains a valid email address.
    /// returns: true if valid
    public func isEmailAddress() -> Bool
    {
        return matches("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,63}$")
    }

    /// Creates a new trimmed string, i.e. removed all starting and ending white spaces.
    var trimmed: String
    {
        return trimmingCharacters(in: .whitespaces)
    }

    /// Remove all starting and ending white spaces.
    mutating func trim()
    {
        self = self.trimmed
    }

    /// Creates a new String with a capitalized first letter
    ///
    /// ``` swift
    /// let capitalizedString = "my senteent".capitalizedFirstLetter()
    /// ```
    var capitalizedFirstLetter: String
    {
        let first = String(prefix(1)).capitalized(with: NSLocale.current)
        let other = String(dropFirst())
        return first + other
    }

    /// Capitalize the first letter of the string
    mutating func capitalizeFirstLetter()
    {
        self = self.capitalizedFirstLetter
    }
}

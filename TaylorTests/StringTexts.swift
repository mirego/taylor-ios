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

import XCTest
import Taylor


class StringTests: XCTestCase {

    func testRegExp()
    {
        let emailRegExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        XCTAssertTrue("genius@mirego.com".isMatching(emailRegExp))
        XCTAssertFalse("genius@mirego".isMatching(emailRegExp))
        XCTAssertFalse("genius@mirego".isMatching(""))

        XCTAssertFalse("".isMatching(""))
        XCTAssertFalse("".isMatching(emailRegExp))

        // Case sensitive
        XCTAssertTrue("genius".isMatching("GENIUS", caseSensitive: false) )
        XCTAssertFalse("genius".isMatching("GENIUS", caseSensitive: true))
    }

    func testIsValidEmail()
    {
        // General
        XCTAssertTrue("genius@mirego.com".isValidEmail())
        XCTAssertTrue("GENIUS@MIREGO.COM".isValidEmail())
        XCTAssertFalse("genius_!mirego1q2312@mirego".isValidEmail())

        // Missing parts
        XCTAssertFalse("@mirego.com".isValidEmail())
        XCTAssertFalse("genius.mirego.com".isValidEmail())
        XCTAssertFalse("genius@mirego".isValidEmail())
        XCTAssertFalse("genius@.com".isValidEmail())

        // With Spaces
        XCTAssertTrue("genius mirego@mirego.com".isValidEmail())
        XCTAssertFalse("genius mirego@mirego domain.com".isValidEmail())
    }
}

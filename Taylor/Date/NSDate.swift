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

public extension Date
{
    /**
     Returns true if the date mathches the specified date's day.

     - parameter anotherDate:     The second date.

     - returns: Returns true if the date mathches the specified date's day
     */
    public func isSameDay(_ anotherDate: Date) -> Bool
    {
        return isEqual(to: anotherDate, unitGranularity: .day)
    }

    /**
     Returns true if the date is equal to the specified date using the specified NSCalendarUnit.

     - parameter to:              The comparison other date.
     - parameter unitGranularity: Optional NSCalendarUnit. Default is Second. 

     - returns: Returns true if the date is equal to the specified date using the specified NSCalendarUnit
     */
    public func isEqual(to toDate: Date, unitGranularity: NSCalendar.Unit = .second) -> Bool
    {
        return (Calendar.current as NSCalendar).compare(self, to: toDate, toUnitGranularity: unitGranularity) == ComparisonResult.orderedSame
    }

    /**
     Returns true if the date is earlier than the specified date using the specified NSCalendarUnit.

     - parameter than:            The comparison other date.
     - parameter unitGranularity: Optional NSCalendarUnit. Default is Second.

     - returns: Returns true if the date is earlier than the specified date using the specified NSCalendarUnit
     */
    public func isEarlier(than thanDate: Date, unitGranularity: NSCalendar.Unit = .second) -> Bool
    {
        return (Calendar.current as NSCalendar).compare(self, to: thanDate, toUnitGranularity: unitGranularity) == ComparisonResult.orderedAscending
    }

    /**
     Returns true if the date is later than the specified date using the specified NSCalendarUnit.

     - parameter than:            The comparison other date.
     - parameter unitGranularity: Optional NSCalendarUnit. Default is Second.

     - returns: Returns true if the date is later than the specified date using the specified NSCalendarUnit
     */
    public func isLater(than thanDate: Date, unitGranularity: NSCalendar.Unit = .second) -> Bool
    {
        return (Calendar.current as NSCalendar).compare(self, to: thanDate, toUnitGranularity: unitGranularity) == ComparisonResult.orderedDescending
    }

    public func daysBetween(toDate: Date) -> Int
    {
        let components = (Calendar.current as NSCalendar).components(.day, from: self, to: toDate, options: [])
        return components.day!
    }

    public func addDaysToDate(_ daysToAdd: Int) -> Date
    {
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: daysToAdd, to: self, options: [])!
    }

    public func getWeekDay() -> Int
    {
        let components = (Calendar.current as NSCalendar).components(.weekday, from: self)
        return components.weekday!
    }
}

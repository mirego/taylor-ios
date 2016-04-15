//
//  URL.swift
//  Taylor
//
//  Created by Romain Pouclet on 2016-04-15.
//  Copyright © 2016 Mirego. All rights reserved.
//

import Foundation

public func cleanURLForDisplay(url: NSURL) -> String? {
    guard let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: true) else { return nil }
    guard var cleaned = components.host else { return nil }

    if cleaned.substringToIndex(cleaned.startIndex.advancedBy(4)) == "www." {
        cleaned.removeRange(cleaned.startIndex..<cleaned.startIndex.advancedBy(4))
    }

    if let path = components.path {
        cleaned += path
    }

    return cleaned
}
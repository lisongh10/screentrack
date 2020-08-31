//
//  Utilities.swift
//  Screenbar
//
//  Created by Li on 8/31/20.
//

import Foundation
import AppKit

public func useSFSymboleIfPossible(fromOldImage old: String, toNewSFSymbol new: String) -> NSImage? {
    if #available(OSX 11.0, *) {
        return NSImage(systemSymbolName: new, accessibilityDescription: nil) ?? nil
    } else {
        return NSImage(named: old) ?? nil
    }
}

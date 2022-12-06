//
// Copyright (C) 2022 Acoustic, L.P. All rights reserved.
//
// NOTICE: This file contains material that is confidential and proprietary to
// Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
// industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
// Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
// prohibited.
//
//  TLFatalErrorUtil.swift
//  SwiftUIMindBlowing
//
//  Created by Omar Hernandez on 11/17/22.
//

import Foundation
import Tealeaf

// overrides Swift global `assert`
public func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    TLFCustomEvent.sharedInstance().logAssertErrorEvent(nil, condition: condition(), message: message(), file: String(describing: file), line: UInt32(line))
    Swift.assert(condition(), message(), file: file, line: line)
}

// overrides Swift global `assertionFailure`
public func precondition(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    TLFCustomEvent.sharedInstance().logPreconditionErrorEvent(nil, condition: condition(), message: message(), file: String(describing: file), line: UInt32(line))
    Swift.precondition(condition(), message(), file: file, line: line)
}

// overrides Swift global `assertionFailure`
@inlinable public func assertionFailure(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    TLFCustomEvent.sharedInstance().logAssertionFailureErrorEvent(nil, message: message(), file: String(describing: file), line: UInt32(line))
    Swift.assertionFailure(message(), file: file, line: line)
}

// overrides Swift global `preconditionFailure`
public func preconditionFailure(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) -> Never {
    TLFCustomEvent.sharedInstance().logPreconditionFailureErrorEvent(nil, message: message(), file: String(describing: file), line: UInt32(line))
    Swift.preconditionFailure(message(), file: file, line: line)
}

// overrides Swift global `fatalError`
public func fatalError(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) -> Never {
    TLFCustomEvent.sharedInstance().logFatalErrorEvent(nil, message: message(), file: String(describing: file), line: UInt32(line))
    Swift.fatalError(message(), file: file, line: line)
}

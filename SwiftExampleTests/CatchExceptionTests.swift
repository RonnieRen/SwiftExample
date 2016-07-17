//
//  CatchExceptionTests.swift
//  SwiftExample
//
//  Created by RonnieRen on 7/17/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import XCTest

import Foundation
@testable import SwiftExample

class CatchExceptionTests: XCTestCase {
    


    func testCatchInternalConsistencyException() {
        do {
            try self.tryCatchException() {
                NSException(name: NSInternalInconsistencyException, reason: "", userInfo: nil).raise()

            }
        }
        catch ExceptionError.InternalInconsistencyExceptionError {
            XCTAssert(true, "NSInternalInconsistencyException is expected to be thrown")
        }
        catch {
            XCTAssert(false, "should not catch a unknown exception")
        }
    }
    
    func testCatchUnKnowException() {
        do {
            try self.tryCatchException() {
               NSException(name: NSGenericException, reason: "", userInfo: nil).raise()
            }
        }
        catch {
            XCTAssert(true, "catch a unknown exception")
        }
    }
}

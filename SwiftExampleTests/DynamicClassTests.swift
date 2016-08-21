//
//  DynamicClassTests.swift
//  SwiftExample
//
//  Created by RonnieRen on 8/21/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import Foundation
import XCTest

final class DynamicClassTests: XCTestCase {
    
    
    func testDynamicClass() {
        let dynamicClass = DynamicClass()
        do {
            try dynamicClass.tryCatchException {
                dynamicClass.dynamicProperty = ""
                print(dynamicClass.dynamicProperty)
            }
        }
        catch let error  {
            print(error)
        }
    }
    
    func testDynamicClassResolved()  {
        let dynamicClass = DynamicClassChild()
        dynamicClass.dynamicProperty = "dd";
        XCTAssert(dynamicClass.dynamicProperty == "dd", "lazy instance method is resolved successfully")
    }
    
    
}
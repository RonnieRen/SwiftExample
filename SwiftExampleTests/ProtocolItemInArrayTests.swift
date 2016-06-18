//
//  ProtocolItemInArrayTests.swift
//  SwiftExample
//
//  Created by RonnieRen on 6/18/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import Foundation


import XCTest
@testable import SwiftExample



class ProtocolItemInArrayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHashableValueInArray() {
        
        let array = [HashableValue.Integer(100), .Text("100"), .UUID(NSUUID())];
        print(array)
        
        if array.contains(HashableValue.Integer(1000)) {
            XCTFail("Should never be euqal in this array");
        }
        
        for item in array {
            if !array.contains(item) {
                XCTFail("Should be euqal in this array");
            }
        }
        
    }
    
    
    
    
    
}
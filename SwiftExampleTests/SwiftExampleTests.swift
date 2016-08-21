//
//  SwiftExampleTests.swift
//  SwiftExampleTests
//
//  Created by RonnieRen on 3/30/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import XCTest
import Result
import ReactiveCocoa
@testable import SwiftExample


class SwiftExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let property = MutableProperty(20)
        do
        {
            property.producer.startWithNext { (v) in
                print("---\(v)")
            }
        }
        
        property.producer.startWithNext { (v) in
            print("######\(v)")
        }
        
        property.value = 30;
        
        print("----")
        
    }
    
    func testPerformanceExample() {
     
        let a: String? = "abc"
        let b: String? = nil
        let c: String? = nil
        print( a == b)
        print( b == c )
        print(a > b )
        print(b > a)
        print( b > c)
        
        print("done")
    }
    

    
    
}

//
//  PropertyTest.swift
//  SwiftExample
//
//  Created by RonnieRen on 12/13/15.
//  Copyright © 2015 RonnieRen. All rights reserved.
//

import Foundation


import XCTest
@testable import SwiftExample

class PropertyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPropertyList() {
        
        let stringProp =  Property(name: "Assignee", valType: PropertyValueType.Text(ValueAndFormatterPair<String>(value: "Ronnie Ren", formatter: TextPropertyFormatter())))
        
        let dateProp = Property(name: "Due Date", valType: PropertyValueType.Date(ValueAndFormatterPair<NSDate>(value: NSDate(), formatter: DatePropertyFormatter(ignoreTime: true))))
        let uuidProp = Property(name: "Commpany", valType: PropertyValueType.UUID(ValueAndFormatterPair<NSUUID>(value: NSUUID(), formatter: UUIDPropertyFormatter())))
        
        let propertyList = [stringProp, dateProp, uuidProp]
        
        for var item in propertyList {
            switch item.valueType {
            case .Text( let valFormatterPair):
                let valueStr = valFormatterPair.formatter.formatProperty(valFormatterPair.value)
                
            case .UUID(let valFormatterPair):
                print(valFormatterPair.formatter.formatProperty(valFormatterPair.value))
            case .Date(let dateAndFormatterPair):
                print(dateAndFormatterPair.formatter.formatProperty(dateAndFormatterPair.value))
                
                
                
            }
        }
        
    }
    
    
    
}

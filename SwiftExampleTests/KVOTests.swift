//
//  KVOTests.swift
//  SwiftExample
//
//  Created by RonnieRen on 7/15/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import Foundation




import XCTest
@testable import SwiftExample


class KVOTests: XCTestCase {
    
    
    func testMonitorComputerProperty() {
        let observer = KVOObserver()
        let observable =  KVOObservable()
        let propertyKeyPath = "KVOValue"
        observable.addObserver(observer, forKeyPath: propertyKeyPath, options: NSKeyValueObservingOptions.New, context: nil)
        
        
        observable.data = NSNumber(integer: 20)
        
        XCTAssert(observer.observedPropertyNewValue?.isEqual(observable.KVOValue) ?? true, "Observer fail to get the new value by kvo notification")
      

        //Crash becaue of NSInternalInconsistencyException !!!, if we don't remove the observer before a observable object is dealloced.
        
        observable.removeObserver(observer, forKeyPath: propertyKeyPath)
        
    }
    
    
    
}

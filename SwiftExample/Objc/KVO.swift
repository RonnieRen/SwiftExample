//
//  KVO.swift
//  SwiftExample
//
//  Created by RonnieRen on 7/15/15.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import Foundation


@objc class KVOObserver: NSObject {
    
    private var observedPropertyValue: AnyObject?
    
    
    var observedPropertyNewValue: AnyObject? {
        get {
            return observedPropertyValue
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
       
        //let the KVOValue, computed property could be observable
        if let kp = keyPath where kp == "KVOValue" {
            print(object)
            print(change)
            //Handle this property computed property changes. TODO.
            self.observedPropertyValue = change?["new"] ?? nil
        }
        else {
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }

}

@objc class KVOObservable: NSObject {
    dynamic var data: NSNumber?
    
    
    var KVOValue: NSNumber {
        get {
            return (data?.integerValue ?? 2) * 2
        }
    }
    
    
    @objc class func keyPathsForValuesAffectingKVOValue() ->Set<String> {
        return ["data"];
    }
    
}

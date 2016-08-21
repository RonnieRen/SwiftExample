//
//  KVOInside.swift
//  SwiftExample
//
//  Created by RonnieRen on 8/18/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import Foundation


@objc
class TestClass: NSObject {
    var x = 0
    var y = 0
    var z = 0

}

func getClassMethodNames(cls: AnyClass) -> [String] {

    var methodCount: UInt32 = 0
    var methods = class_copyMethodList(cls, &methodCount)


    var names: [String] = []
    for _ in 0..<methodCount {
        names.append(method_getName(methods.memory).description)
        methods = methods.successor()
    }

    return names
}


//func PrintObjectDescription(object: AnyObject, name: String) {
//    print("name: \(name), obj: \(object), NSObject class: \(class_getName(object.dynamicType)), libobjc class: \(class_getName(object.self())) (getClassMethodNames(object.self()))")
//}
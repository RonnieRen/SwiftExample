//
//  ProtocolItemInArray.swift
//  SwiftExample
//
//  Created by RonnieRen on 6/17/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import Foundation


//public class HashableValue<T where T: Hashable> {
//    
//}

public enum HashableValue {
    case Text(String)
    case UUID(NSUUID)
    case Integer(Int)
}

public func == (lhs: HashableValue, rhs: HashableValue) -> Bool {
    switch (lhs, rhs) {
    case (let .Text(lTxt), let .Text(rTxt)):
        return lTxt == rTxt
    case (let .UUID(luuid), let .UUID(ruuid)):
        return luuid == ruuid
    case (let .Integer(lInt), let .Integer(rInt)):
        return lInt == rInt
    default:
        return false
    }
}


extension HashableValue: Hashable {
    public var hashValue: Int {
        switch self {
        case let .Integer(v):
            return v
        case let .Text(txt):
            return txt.hashValue
        case let .UUID(uuid):
            return uuid.hashValue
        }
    }
}



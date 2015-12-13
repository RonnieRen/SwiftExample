//
//  Property.swift
//  SwiftExample
//
//  Created by RonnieRen on 12/13/15.
//  Copyright © 2015 RonnieRen. All rights reserved.
//

import Foundation
import ReactiveCocoa





class PropertyFormatter<T>  {
    func formatProperty(value: T?) -> String {
        fatalError("This method must be implemented")
    }
}


class TextPropertyFormatter : PropertyFormatter<String> {
    override func formatProperty(value: String? ) -> String {
        return value ?? ""
    }
    
}

class DatePropertyFormatter: PropertyFormatter<NSDate> {
    
    let ignoreTime: Bool
    
    init(ignoreTime: Bool = false){
        self.ignoreTime = ignoreTime
    }
    
    override func formatProperty(value: NSDate?) -> String {
        guard let date = value else {
            return "UnSpecified"
        }
        if self.ignoreTime {
            return NSDateFormatter.localizedStringFromDate(date, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.NoStyle);
        }
        return NSDateFormatter.localizedStringFromDate(date, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle);
    }
}


class UUIDPropertyFormatter: PropertyFormatter<NSUUID> {
    override func formatProperty(value: NSUUID?) -> String {
        guard let uuid = value else {
            return ""
        }
        return uuid.UUIDString
    }
}


struct ValueAndFormatterPair<T> {
    let value: MutableProperty<T?>
    let formatter: PropertyFormatter<T>
    
    init(value: T?, formatter: PropertyFormatter<T>){
        self.value = MutableProperty(value)
        self.formatter = formatter
    }
}


enum PropertyValueType {
    
    case Text(ValueAndFormatterPair<String>)
    case UUID(ValueAndFormatterPair<NSUUID>)
    case Date(ValueAndFormatterPair<NSDate>)
}

class Property {
    
    let name: String
    let valueType: PropertyValueType
    
    init(name: String, valType: PropertyValueType) {
        self.name = name
        self.valueType = valType
    }
    
}

//
//let stringProp =  Property(name: "Assignee", valType: PropertyValueType.Text(ValueAndFormatterPair<String>(value: "Ronnie Ren", formatter: TextPropertyFormatter())))



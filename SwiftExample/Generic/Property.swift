//
//  Property.swift
//  SwiftExample
//
//  Created by RonnieRen on 12/13/15.
//  Copyright © 2015 RonnieRen. All rights reserved.
//

import Foundation
import ReactiveCocoa



protocol ValueFormattable {
    func toValueString() -> String
}

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


struct ValueAndFormatterPair<T> : ValueFormattable {
    let value: MutableProperty<T?>
    let formatter: PropertyFormatter<T>
    
    init(value: T?, formatter: PropertyFormatter<T>){
        self.value = MutableProperty(value)
        self.formatter = formatter
    }
    func toValueString() -> String {
        return formatter.formatProperty(value.value)
    }
}


enum PropertyValue {
    
    case Text(ValueAndFormatterPair<String>)
    case UUID(ValueAndFormatterPair<NSUUID>)
    case Date(ValueAndFormatterPair<NSDate>)
    
    static func textValue(val: String,formatter: PropertyFormatter<String>) -> PropertyValue {
        return PropertyValue.Text(ValueAndFormatterPair<String>(value: val, formatter: formatter))
    }
    
    static func dateValue(val: NSDate, formatter: PropertyFormatter<NSDate>) -> PropertyValue {
        return PropertyValue.Date(ValueAndFormatterPair<NSDate>(value: val, formatter: formatter))
    }
    
    static func uuidValue(val: NSUUID, formatter: PropertyFormatter<NSUUID>) -> PropertyValue {
        return PropertyValue.UUID(ValueAndFormatterPair<NSUUID>(value: val, formatter: formatter))
    }
    
    
    func valueFormattable() -> ValueFormattable {
        switch self {
        case.Text(let pair):
            return pair
        case.Date(let pair):
            return pair
        case.UUID(let pair):
            return pair
        }
    }
    
//    func toValueString() -> String {
//        switch self {
//        case .Text(let val):
//            return val.formatter.formatProperty(val.value.value)
//
//        case .Date(let val):
//            return val.formatter.formatProperty(val.value.value)
//
//        case .UUID(let val):
//            return val.formatter.formatProperty(val.value.value)
//        }
//    }
    
    
//    func toValueStirngDuringEditing() -> String {
//        guard let pair = self.getAssociatedValue() else {
//            return ""
//        }
//        
//        return pair.formatter.formatProperty(pair.value)
//    }
//    
//    
//    private func getAssociatedValue<T>() -> ValueAndFormatterPair<T> {
//        switch self {
//        case .Text(let pair):
//            return pair
//        case .UUID(let pair):
//            return pair
//        case .Date(let pair):
//            return pair
//        }
//    }
}

extension PropertyValue: ValueFormattable {
    func toValueString() -> String {
        return self.valueFormattable().toValueString()
    }
}


class Property {
    
    let name: String
    let value: PropertyValue
    let valueStr: String
    
    init(name: String, val: PropertyValue) {
        self.name = name
        self.value = val
        self.valueStr = val.toValueString()
    }
    
    
    
    
}

//
//let stringProp =  Property(name: "Assignee", valType: PropertyValueType.Text(ValueAndFormatterPair<String>(value: "Ronnie Ren", formatter: TextPropertyFormatter())))



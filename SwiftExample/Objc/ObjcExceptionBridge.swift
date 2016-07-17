//
//  ObjcExceptionBridge.swift
//  SwiftExample
//
//  Created by RonnieRen on 7/16/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

import Foundation

//TODO add more exceptions
enum ExceptionError: ErrorType {
    case InternalInconsistencyExceptionError
    case UnKnownError(String)
    
    init(exceptionName: String) {
        switch exceptionName {
        case NSInternalInconsistencyException:
            self = .InternalInconsistencyExceptionError
        default:
            self = .UnKnownError(exceptionName)
        }
    }
}

extension NSObject {
    
    
    func tryCatchException(tryBlock: (() -> ())) throws {
        if let exceptionName = self.executeBlockAndReturnExceptionNameIfCatchingException(tryBlock) {
            throw ExceptionError.init(exceptionName: exceptionName)
        }
    }
    
    
}
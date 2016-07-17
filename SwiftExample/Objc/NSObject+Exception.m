//
//  NSObject+Exception.m
//  SwiftExample
//
//  Created by RonnieRen on 7/16/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

#import "NSObject+Exception.h"

@implementation NSObject(Exception)

- (NSString* __nullable )executeBlockAndReturnExceptionNameIfCatchingException: (void(^ _Nonnull)()) block {
   
    @try {
        block();
    }
    @catch (NSException * ex) {
        return  ex.name;
    }
    return  nil;
    
}

@end

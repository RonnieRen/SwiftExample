//
//  NSObject+Exception.h
//  SwiftExample
//
//  Created by RonnieRen on 7/16/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(Exception)

- (NSString* __nullable )executeBlockAndReturnExceptionNameIfCatchingException: (void(^ _Nonnull)()) block;


@end

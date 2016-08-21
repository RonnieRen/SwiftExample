//
//  DynamicClass.h
//  SwiftExample
//
//  Created by RonnieRen on 8/21/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicClass : NSObject
@property(nonatomic) NSString* dynamicProperty;
@end


@interface DynamicClassChild : DynamicClass

@end
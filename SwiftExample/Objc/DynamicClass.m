//
//  DynamicClass.m
//  SwiftExample
//
//  Created by RonnieRen on 8/21/16.
//  Copyright © 2016 RonnieRen. All rights reserved.
//


#import <objc/runtime.h>
#import "DynamicClass.h"

NSString* dynamicPropertyVariable = nil;
void resolveThisMethodDynamically_Set(id this, SEL cmd, NSString* value) {
    dynamicPropertyVariable = value;
}

NSString* resolveThisMethodDynamically_Get(id this, SEL cmd) {
    return dynamicPropertyVariable;
}

@implementation DynamicClass
@dynamic dynamicProperty;




@end


@implementation DynamicClassChild

+ (BOOL) resolveInstanceMethod:(SEL)aSEL {
    if (aSEL == @selector(dynamicProperty))
    {
        class_addMethod([self class], aSEL, (IMP) resolveThisMethodDynamically_Get, "v@");
        return YES;
    }
    else if (aSEL == @selector(setDynamicProperty:))
    {
        class_addMethod([self class], aSEL, (IMP) resolveThisMethodDynamically_Set, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}

@end




//
//  NSArray+PTVSafe.m
//  PandaTV-HD
//
//  Created by sunwanhua on 16/9/16.
//  Copyright © 2016年 zuowenping. All rights reserved.
//

#import "NSArray+PTVSafe.h"

@implementation NSArray (PTVSafe)

- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index < [self count]) {
        return [self objectAtIndex:index];
    }
    
    return nil;
}

@end

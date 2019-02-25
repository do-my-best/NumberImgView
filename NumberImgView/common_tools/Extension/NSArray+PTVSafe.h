//
//  NSArray+PTVSafe.h
//  PandaTV-HD
//
//  Created by sunwanhua on 16/9/16.
//  Copyright © 2016年 zuowenping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (PTVSafe)

- (id)safe_objectAtIndex:(NSUInteger)index;

@end

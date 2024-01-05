//
//  ListNode.m
//  LetCode
//
//  Created by JarlenJohn on 2023/11/14.
//

#import "ListNodeOC.h"

@implementation ListNodeOC

- (instancetype)init {
    if (self = [super init]) {
        _val = 0;
        _next = nil;
        
        return self;
    }
    return nil;
}

- (instancetype)initWithVal:(NSInteger)val {
    if (self = [super init]) {
        _val = val;
        _next = nil;
        
        return self;
    }
    return nil;
}

- (instancetype)initWithVal:(NSInteger)val next:(ListNodeOC *)next {
    if (self = [super init]) {
        _val = val;
        _next = next;
        
        return self;
    }
    return nil;
}


@end

//
//  StackOC.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/22.
//

#import "StackOC.h"

@interface StackOC ()

@property (nonatomic, strong) NSMutableArray *items;
@end


@implementation StackOC

- (void)push:(id)t {
    if (![self.items containsObject:t]) {
        [self.items addObject:t];
    }
}

- (id)pop {
    id resu = self.items.lastObject;
    [self.items removeLastObject];
    return resu;
}

- (id)top {
    return self.items.lastObject;
}

- (void)cleanAll {
    [self.items removeAllObjects];
}

- (BOOL)empty {
    return self.items.count == 0;
}


#pragma mark - Lazy load
- (NSMutableArray *)items {
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}


@end

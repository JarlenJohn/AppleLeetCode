//
//  Number40.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/26.
//

#import "Number40.h"

@interface Number40 ()

@property (nonatomic, strong) NSMutableArray <NSArray *>*freq;
@property (nonatomic, strong) NSMutableArray *sequece;
@property (nonatomic, strong) NSMutableArray <NSArray *>*ans;

@end


@implementation Number40

- (instancetype)init {
    self = [super init];
    if (self) {
        _freq = [NSMutableArray array];
        _sequece = [NSMutableArray array];
        _ans = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)combinationSum:(NSArray *)candidates target:(NSInteger)target {
    candidates = [candidates sortedArrayUsingComparator:^NSComparisonResult(NSNumber * obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    
    //记录每个数据出现的次数
    for (NSNumber *num in candidates) {
        NSInteger inte = [num integerValue];
        if (_freq.count == 0 || [_freq.lastObject[0] integerValue] != inte) {
            [_freq addObject:@[num, @1]];
        }else {
            NSInteger cnt = [_freq.lastObject[1] integerValue] + 1;
            [_freq removeLastObject];
            [_freq addObject:@[num, @(cnt)]];
        }
    }
    
    [self dfs:0 rest:target];
    
    return self.ans;
}

- (void)dfs:(NSInteger)pos rest:(NSInteger)rest {
    if (rest == 0) {
        [self.ans addObject:self.sequece];
        return;
    }
    
    if (pos == self.freq.count || rest < [self.freq[pos].firstObject integerValue]) {
        return;
    }
    
    [self dfs:pos+1 rest:rest];
    
    NSInteger most = MIN(rest/[self.freq[pos].firstObject integerValue], [self.freq[pos].lastObject integerValue]);
    for (NSInteger i = 1; i<=most; i++) {
        [self.sequece addObject:self.freq[pos].firstObject];
        
        [self dfs:pos+1 rest:rest-i*[self.freq[pos].firstObject integerValue]];
    }
    
    for (NSInteger i = 1; i<=most; i++) {
        [self.sequece removeLastObject];
    }
}

@end

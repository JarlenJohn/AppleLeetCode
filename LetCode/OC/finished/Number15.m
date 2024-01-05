//
//  Number15.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/19.
//

#import "Number15.h"

@implementation Number15

-(NSArray <NSNumber *>*)threeSum:(NSArray *)nums {
    NSArray *sortedNums = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber * obj1, NSNumber * obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSMutableArray *results = @[].mutableCopy;
    
    NSInteger cnt = nums.count;
    for (NSInteger i=0; i<cnt; i++) {
        // 需要和上一次枚举的数不相同
        if (i>0 && [sortedNums[i] integerValue] == [sortedNums[i-1] integerValue]) {
            continue;
        }
        
        NSInteger target = -[sortedNums[i] integerValue];
        //定义双指针
        NSInteger k = cnt-1;
        for (NSInteger j=i+1; j<cnt; j++) {
            // 需要和上一次枚举的数不相同
            if (j>i+1 && [sortedNums[j] integerValue] == [sortedNums[j-1] integerValue]) {
                continue;
            }
            
            while (j < k && [sortedNums[j] integerValue] + [sortedNums[k] integerValue] > target) {
                k--;
            }
            
            if (j == k) {
                break;
            }
            
            if ([sortedNums[j] integerValue] + [sortedNums[k] integerValue] == target) {
                [results addObject:@[sortedNums[i], sortedNums[j], sortedNums[k]]];
            }
        }
    }
    return results;
}
    
@end

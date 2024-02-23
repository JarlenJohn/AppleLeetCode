//
//  Number41.m
//  LetCode
//
//  Created by JarlenJohn on 2024/2/23.
//

#import "Number41.h"

@implementation Number41

- (NSInteger)firstMissingPositive:(NSArray *)nums {
    
    NSMutableArray *numsM = [nums mutableCopy];
    NSInteger cnt = numsM.count;
    
    //1.将数组中小于等于0的数转成N+1
    for (NSInteger i=0; i<cnt; i++) {
        if ([numsM[i] integerValue] <= 0) {
            numsM[i] = [NSNumber numberWithInteger:cnt+1];
        }
    }
    
    //2.将<=cnt的元素对应位置变为负数
    for (NSInteger i=0; i<cnt; i++) {
        NSInteger num = [numsM[i] integerValue];
        
        if (num <= cnt) {
            numsM[num-1] = [NSNumber numberWithInteger:-labs([numsM[num-1] integerValue])];
        }
    }
    
    //3.返回第一个大于零的元素下标+1
    for (NSInteger i=0; i<cnt; i++) {
        if ([numsM[i] integerValue] > 0) {
            return i+1;
        }
    }
    
    return cnt+1;
}

@end

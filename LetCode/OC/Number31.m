//
//  Number31.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/8.
//

#import "Number31.h"

@implementation Number31

//下一排列
- (void)nextPermutation:(NSMutableArray *)nums {
    NSInteger cnt = nums.count;
    
    NSInteger i = cnt - 2;
    while (i >= 0 && [nums[i] integerValue] >= [nums[i+1] integerValue]) {
        i--;
    }
    
    if (i >= 0) {
        NSInteger j = cnt - 1;
        while (j >= 0 && [nums[j] integerValue] <= [nums[i] integerValue]) {
            j--;
        }
        
        [nums exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    i = i + 1;
    NSInteger j = cnt - 1;
    while (i < j) {
        [nums exchangeObjectAtIndex:i withObjectAtIndex:j];
        
        i++;
        j--;
    }
}

@end

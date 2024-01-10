//
//  Number33.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/10.
//

#import "Number33.h"

@implementation Number33

-(NSInteger)search:(NSArray <NSNumber *>*)nums target:(NSInteger)target {
    NSInteger cnt = nums.count;
    
    NSInteger left = 0, right = cnt-1;
    
    while (left <= right) {
        NSInteger mid = (left + right) >> 1;
        
        if (target == [nums[mid] integerValue]) {
            return mid;
        }
        
        //用到了定理：每次二分都会至少存在一个顺序区间
        if ([nums[mid] integerValue] >= [nums[left] integerValue]) {//左侧严格升序
            if(target >= [nums[left] integerValue] && target < [nums[mid] integerValue]) {//target是否在升序区间内
                right = mid - 1;
            }else {
                left = mid + 1;
            }
        }else {//右侧严格升序
            if (target > [nums[mid] integerValue] && target <= [nums[right] integerValue]) {//target是否在升序区间内
                left = mid + 1;
            }else {
                right = mid - 1;
            }
        }
    }
    
    return -1;
}

@end

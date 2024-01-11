//
//  Number34.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/11.
//

#import "Number34.h"

@implementation Number34

//非严格递增的序列中查找target的起始位置
-(NSArray *)searchRange:(NSArray <NSNumber *>*)nums
                 target: (NSInteger)target {
    NSInteger leftIdx = [self binarySearch:nums lower:YES target:target];
    NSInteger rightIdx = [self binarySearch:nums lower:NO target:target];
    
    if (leftIdx <= rightIdx && rightIdx<nums.count && ([nums[leftIdx] integerValue] == [nums[rightIdx] integerValue])) {
        return @[@(leftIdx), @(rightIdx)];
    }
    
    return @[@-1, @-1];
}


/// 二分查找，在nums数组中大于或大于等于target的第一个索引位置
/// - Parameters:
///   - nums: 有序数列
///   - lower: 为true表示大于等于target的索引，为false表示大于target的索引
///   - target: 目标值
- (NSInteger)binarySearch:(NSArray *)nums lower:(BOOL)lower target:(NSInteger)target {
    NSInteger left = 0, right = nums.count-1;
    NSInteger ans = nums.count;
    
    while (left <= right) {
        NSInteger mid = (left + right) >> 1;
        
        if (target < [nums[mid] integerValue] || (lower && target <= [nums[mid] integerValue])) {
            right = mid - 1;
            ans = mid;
        }else {
            left = mid + 1;
        }
    }
    
    return ans;
}

@end

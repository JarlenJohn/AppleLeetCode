//
//  Number35.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/11.
//

#import "Number35.h"

@implementation Number35
//由于要考虑到插入，位置为pos，有nums[pos-1] < target <= nums[pos],
//因此，问题转换为[找出第一个大于等于target的元素所在的位置]
- (NSInteger)searchInsert:(NSArray *)nums
                   target:(NSInteger)target {
    NSInteger cnt = nums.count;
    NSInteger left = 0, right = cnt - 1;
    NSInteger ans = cnt;//赋值为cnt可减少边界情况处理，如target大于所有元素，那么就在最后一个位置插入
    
    while (left <= right) {
        NSInteger mid = (left + right) >> 1;
        
        if (target <= [nums[mid] integerValue]) {
            ans = mid;
            right = mid - 1;
        }else {
            left = mid + 1;
        }
    }
    
    return ans;
}

@end

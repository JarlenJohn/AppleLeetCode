//
//  Number42.m
//  LetCode
//
//  Created by JarlenJohn on 2024/2/24.
//

#import "Number42.h"

@implementation Number42


-(NSInteger)trap:(NSArray *)height {
    NSInteger ans = 0;
    
    NSInteger cnt = height.count;
    NSInteger left = 0, right = cnt - 1;
    NSInteger leftMax = 0, rightMax = 0;
    
    while (left < right) {
        leftMax = MAX(leftMax, [height[left] integerValue]);
        rightMax = MAX(rightMax, [height[right] integerValue]);
        
        if ([height[left] integerValue] < [height[right] integerValue]) {
            ans += leftMax - [height[left] integerValue];
            ++left;
        }else {
            ans += rightMax - [height[right] integerValue];
            --right;
        }
    }
    
    return ans;
}

@end

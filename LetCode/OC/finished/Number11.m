//
//  Number11.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/13.
//

#import "Number11.h"

@implementation Number11


- (NSInteger)maxArea:(NSArray *)height {
    NSInteger maxArea = 0;
    
    NSInteger i=0;
    NSInteger j = height.count-1;
    while (i<j) {
        if ([height[i] integerValue] < [height[j] integerValue]) {
            maxArea = MAX(maxArea, [height[i] integerValue] * (j-i));
            i++;
        }else {
            maxArea = MAX(maxArea, [height[j] integerValue] * (j-i));
            j--;
        }
    }
    
    return maxArea;
}

@end

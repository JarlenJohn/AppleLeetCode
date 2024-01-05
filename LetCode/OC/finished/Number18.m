//
//  Number18.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/21.
//

#import "Number18.h"

@implementation Number18

-(NSArray *)fourSum:(NSArray *)nums
             target: (NSInteger)target {
    NSMutableArray *result = @[].mutableCopy;
    
    if (nums.count < 4) {
        return result;
    }
    
    nums = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1,  NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSInteger cnt = nums.count;
    for (NSInteger i=0; i<cnt-3; i++) {
        if (i>0 && nums[i] == nums[i-1]) {
            continue;
        }
        
        //若刚开始就比target大，则直接结束
        if ([nums[i] integerValue] + [nums[i+1] integerValue] + [nums[i+2] integerValue]+ [nums[i+3] integerValue] > target) {
            break;
        }
        
        if ([nums[i] integerValue] + [nums[cnt-3] integerValue] + [nums[cnt-2] integerValue] + [nums[cnt-1] integerValue] < target) {
            continue;
        }
        
        for (NSInteger j=i+1; j<cnt-2; j++) {
            if (j > i+1 && nums[j] == nums[j-1]) {
                continue;
            }
            
            NSInteger k=j+1, l=cnt-1;
            while (k < l) {
                NSInteger s = [nums[i] integerValue] + [nums[j] integerValue] + [nums[k] integerValue] + [nums[l] integerValue];
                if (s == target) {
                    [result addObject:@[nums[i], nums[j], nums[k], nums[l]]];
                    
                    while (k<l && [nums[k] integerValue] == [nums[k+1] integerValue]) {
                        k++;
                    }
                    k++;
                    
                    while (k<l && [nums[l] integerValue] == [nums[l-1] interval]) {
                        l--;
                    }
                    l--;
                }else if(s < target) {
                    k++;
                }else {
                    l--;
                }
            }
        }
    }
    
    return  result;
}

@end

//
//  Number16.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/20.
//

#import "Number16.h"

@implementation Number16

-(NSInteger)threeSumClosest:(NSArray *)nums target:(NSInteger)target {
    if (nums.count < 3) {
        return 0;
    }
    
    //先排序
    NSArray *sortedNum = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSInteger cnt = sortedNum.count;
    
    __block NSInteger result = 1e7;
    
    void (^updateValue)(NSInteger) = ^(NSInteger sum) {
        if (labs(sum - target) < labs(result-target)) {
            result = sum;
        }
    };
    
    //开始遍历
    for (NSInteger i=0; i<cnt; i++) {
        //过滤重复的部分
        if (i>0 && sortedNum[i] == sortedNum[i-1]) {
            continue;
        }
        
        //由于有序，后面无论怎么选，选出的三个数的和不会比 s 还小
        if (i<cnt-2 && [sortedNum[i] integerValue] +[sortedNum[i+1] integerValue] + [sortedNum[i+2] integerValue] >= target) {
            updateValue([sortedNum[i] integerValue]+[sortedNum[i+1] integerValue] + [sortedNum[i+2] integerValue]);
            break;
        }
        
        //由于数组已经排序，nums[i] 加上后面任意两个数都不超过 s，所以下面的双指针就不需要跑了，但i增大后存在可能，因此继续外层
        if (cnt > 1 && i<cnt-2 && [sortedNum[i] integerValue] + [sortedNum[cnt-2] integerValue]+ [sortedNum[cnt-1] integerValue] < target) {
            updateValue([sortedNum[i] integerValue]+[sortedNum[cnt-2] integerValue]+[sortedNum[cnt-1] integerValue]);
            continue;
        }
        
        NSInteger j=i+1, k=cnt-1;
        while (j<k) {
            NSInteger s = [sortedNum[i] integerValue] + [sortedNum[j] integerValue] + [sortedNum[k] integerValue];
            if (s == target) {
                return s;
            }
            
            updateValue(s);
            
            if(s < target) {
                NSInteger j0 = j+1;
                //过滤重复的部分
                while (j0 < cnt && [sortedNum[j0] integerValue] == [sortedNum[j0-1] integerValue]) {
                    j0++;
                }
                j = j0;
            }else {
                NSInteger k0 = k-1;
                while (k0 > 0 && [sortedNum[k0] integerValue] == [sortedNum[k0+1] integerValue]) {
                    k0--;
                }
                k = k0;
            }
        }
    }
    
    return result;
}

@end

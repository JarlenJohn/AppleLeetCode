//
//  Number29.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/4.
//

#import "Number29.h"

@implementation Number29

/*
 看到题第一反应：这啥鬼，除法不是很简单，为啥要搞这么复杂
 看了题解：牛，有点东西，思路很好很清奇
 
 1.边界判断
    此处假设除数不为0
    被除数为0，结果必然为0
    除数为1，结果为被除数
    除数为-1时，一般情况只取反被除数就可以，但注意题目要求32位，范围是-2^31 ~ 2^31-1,假设被除数恰好是-2^31，那么取反后越界了，超过2^31-1，因此返回INT32_MAX
 
 2.开始运算
    方便期间，先标记结果的正负，然后吧所有数据转成正数处理，最后结果用标记处理正确即可
 
    
    「快速乘」算法实现，类似快速幂算法
 */

-(int32_t)divide:(int32_t)dividend divisor:(int32_t)divisor {
    if (dividend == 0) {
        return 0;
    }
    
    if (divisor == 1) {
        return dividend;
    }
    
    if (divisor == -1) {
        if (dividend > INT32_MIN) {
            return -dividend;
        }
        return INT32_MAX;
    }
    
    //结果正负标记
    bool isPositive = (dividend > 0 && divisor > 0) || ( dividend < 0 && divisor < 0);
    int32_t a = dividend > 0 ? dividend : -dividend;
    int32_t b = divisor > 0 ? divisor : -divisor;
    
    int32_t res = [self divide:a divisor:b];
    return isPositive ? res : -res;
}

//「快速乘」算法
- (int32_t)divWithA:(int32_t)a b:(int32_t)b {
    if (a < b) {
        return 0;
    }
    
    int32_t count = 1;
    int32_t result = b;
    while (result + result <= a) {
        count += count;
        result += result;
    }
    
    return count + [self divWithA:a-result b:b];
}


@end

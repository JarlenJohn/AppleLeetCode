//
//  Number50.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/4.
//

#import "Number50.h"

@implementation Number50

-(double)myPow:(double)x n:(NSInteger)n {
    NSInteger N = n;
    
    return N > 0 ? [self quickMul:x n:N] : 1/[self quickMul:x n:-N];
}

//递归法
/*
 时间复杂度:O(logn)
 空间复杂度:O(n)
 */
//-(double)quickMul:(double)x n:(NSInteger)n {
//    if (n == 0) {
//        return 1;
//    }
//    
//    double y = [self quickMul:x n:n/2];
//    return n % 2 == 0 ?  y*y : x*y*y;
//}


//迭代法,技巧性比较强
/*
 时间复杂度:O(logn)
 空间复杂度:O(1)
 */
-(double)quickMul:(double)x n:(NSInteger)n {
    double x_contribute = x;
    double ans = 1.0;
    while (n > 0) {
        if (n % 2 == 1) {
            ans *= x_contribute;
        }
        
        x_contribute *= x_contribute;
        
        n /= 2;
    }
    return ans;
}


    
@end

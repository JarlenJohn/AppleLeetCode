//
//  Number28.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/3.
//

#import "Number28.h"

@implementation Number28

/*
 时间复杂度：O(n*m)
 空间复杂度：O(1)
 */

//暴力法
//-(NSInteger)strStr:(NSString *)haystack needle:(NSString *)needle {
//    if (needle.length <= 0) {
//        return -1;
//    }
//    
//    NSInteger n = haystack.length, m = needle.length;
//    for (NSInteger i=0; i+m<=n; i++) {
//        
//        NSInteger j = 0;
//        while (j<m && [haystack characterAtIndex:i+j] == [needle characterAtIndex:j]) {
//            j++;
//        }
//        
//        if (j == m) {
//            return i;
//        }
//    }
//    return -1;
//}

/*
 时间复杂度：O(n+m)
 空间复杂度：O(1)
 */

//KMP
-(NSInteger)strStr:(NSString *)haystack needle:(NSString *)needle {
    NSInteger n = haystack.length;
    NSInteger m = needle.length;
    if (m <= 0) {
        return 0;
    }
    
    NSMutableArray *next = [NSMutableArray array];
    for (NSInteger i=0; i<m; i++) {
        next[i] = @(0);
    }
    
    //求next数组
    NSInteger i=1;
    NSInteger j = 0;
    for (; i<m; i++) {
        //不相等的情况
        if (j>0 && [needle characterAtIndex:i] != [needle characterAtIndex:j]) {
            j = [next[j-1] integerValue];
        }
        
        //相等情况
        if ([needle characterAtIndex:i] == [needle characterAtIndex:j]) {
            j++;
        }
     
        //赋值
        next[i] = [NSNumber numberWithInteger:j];
    }
    
    j = 0;
    for (i=0; i<n; i++) {
        if (j > 0 && [haystack characterAtIndex:i] != [needle characterAtIndex:j]) {
            j = [next[j-1] integerValue];
        }
        
        if ([haystack characterAtIndex:i] == [needle characterAtIndex:j]) {
            j++;
        }
        
        if (j == m) {
            return i-m+1;
        }
    }
    return -1;
}
    
@end

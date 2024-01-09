//
//  Number32.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/9.
//

#import "Number32.h"
#import "StackOC.h"

@implementation Number32

//栈
//- (NSInteger)longestValidParentheses:(NSString *)s {
//    NSInteger res = 0;
//    
//    //存放[最后一个没有被匹配的右括号的下标]
//    StackOC *stack = [[StackOC alloc] init];
//    [stack push:@(-1)];//
//    
//    for (NSInteger i=0; i<s.length; i++) {
//        unichar character = [s characterAtIndex:i];
//        if (character == '(') {
//            [stack push:@(i)];
//        }else if(character == ')') {
//            [stack pop];
//            
//            if ([stack empty]) {
//                [stack push:@(i)];
//            }else {
//                //当前右括号索引减去上一个右括号的索引，表示最长串
//                res = MAX(res, i-[[stack top] integerValue]);
//            }
//        }
//    }
//    
//    return res;
//}


//双指针+左右遍历
- (NSInteger)longestValidParentheses:(NSString *)s {
    NSInteger left = 0, right = 0, maxLen = 0;
    
    //从左向右匹配一次
    for (NSInteger i=0; i<s.length; i++) {
        unichar charater = [s characterAtIndex:i];
        if (charater == '(') {
            left++;
        }else if(charater == ')') {
            right++;
        }
        
        if (left == right) {
            maxLen = MAX(maxLen, 2 * right);
        }else if(right > left) {
            left = right = 0;
        }
    }
    
    //从右向左匹配一次
    for (NSInteger i=s.length-1; i>0; i--) {
        unichar charater = [s characterAtIndex:i];
        if (charater == '(') {
            left++;
        }else if(charater == ')') {
            right++;
        }
        
        if (left == right) {
            maxLen = MAX(maxLen, 2*left);
        }else if(left > right) {
            left = right = 0;
        }
    }
    
    return maxLen;
}

@end

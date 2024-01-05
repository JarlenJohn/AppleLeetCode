//
//  Number14.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/18.
//

#import "Number14.h"

@implementation Number14

//竖向扫描法
//-(NSString *)longestCommonPrefix:(NSArray <NSString *>*)strs {
//    if (strs.count <= 0) {
//        return @"";
//    }
//    
//    NSString *firstStr = strs.firstObject;
//    NSInteger len = firstStr.length;
//    for (NSInteger i=0; i<len; i++) {
//        for (NSInteger j=1; j<strs.count; j++) {
//            if (strs[j].length == i || [strs[j] characterAtIndex:i] != [firstStr characterAtIndex:i]) {
//                return [firstStr substringToIndex:i];
//            }
//        }
//    }
//    
//    return firstStr;
//}

//有序首尾比较法
-(NSString *)longestCommonPrefix:(NSArray *)strs {
    NSArray *sortedStrs = [strs sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
    
    NSString *res = @"";
    NSString *firstStr = sortedStrs.firstObject;
    NSString *lastStr = sortedStrs.lastObject;
    for (NSInteger i=0; i<firstStr.length; i++) {
        if ([firstStr characterAtIndex:i] == [lastStr characterAtIndex:i]) {
            unichar c = [firstStr characterAtIndex:i];
            res = [res stringByAppendingString:[NSString stringWithCharacters:&c length:1]];
        }else {
            break;
        }
    }
    
    return res;
}

@end

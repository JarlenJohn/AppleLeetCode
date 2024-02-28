//
//  Number43.m
//  LetCode
//
//  Created by JarlenJohn on 2024/2/28.
//

#import "Number43.h"

@implementation Number43

- (NSString *)multiply:(NSString *)num1 num2:(NSString *)num2 {
    
    if ([num1 isEqualToString:@"0"] || [num2 isEqualToString:@"0"]) {
        return @"0";
    }
    
    NSString *ans = @"";
    NSInteger m = num1.length;
    NSInteger n = num2.length;
    
    for (NSInteger i=n-1; i>=0; i--) {
        NSMutableArray *cur = @[].mutableCopy;
        NSInteger add = 0;//进位
        
        for (NSInteger j=n-1; j>i; j--) {
            [cur addObject:@(0)];
        }
        
        NSInteger x = [num2 characterAtIndex:i] - '0';
        
        for (NSInteger j=m-1; j>=0; j--) {
            NSInteger y = [num1 characterAtIndex:j] - '0';
            
            NSInteger result = x * y + add;
            
            [cur addObject:@(result%10)];
            add = result / 10;
        }
        
        while (add != 0) {
            [cur addObject:@(add%10)];
            add /= 10;
        }
        
        NSMutableString *str2 = @"".mutableCopy;
        [cur enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [str2 appendString:[NSString stringWithFormat:@"%d", [obj intValue]]];
        }];
        
        ans = [self addStrings:ans str2:str2];
    }
    return ans;
}


/// 两个字符串相加
/// - Parameters:
///   - str1: 字符串1
///   - str2: 字符串2
- (NSString *)addStrings:(NSString *)str1 str2:(NSString *)str2 {
    NSMutableArray *ans = @[].mutableCopy;
    NSInteger m = str1.length - 1, n = str2.length - 1, add = 0;
    
    while (m >= 0 || n >= 0 || add != 0) {
        NSInteger x = m >= 0 ? [str1 characterAtIndex:m] - '0' : 0;
        NSInteger y = n >= 0 ? [str2 characterAtIndex:n] - '0' : 0;
        
        NSInteger result = x + y + add;
        [ans addObject:@(result % 10)];
        add = result / 10;
        
        m--;
        n--;
    }
    
    NSMutableString *result = @"".mutableCopy;
    [ans enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [result appendString:[NSString stringWithFormat:@"%d", [obj intValue]]];
    }];
    return result;
}

@end

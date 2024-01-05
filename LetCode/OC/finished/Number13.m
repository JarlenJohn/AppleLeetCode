//
//  Number13.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/18.
//

#import "Number13.h"

@implementation Number13


- (NSInteger)romanToInt:(NSString *)s {
    NSDictionary *symbols = @{
        @"I":@1,
        @"V":@5,
        @"X":@10,
        @"L":@50,
        @"C":@100,
        @"D":@500,
        @"M":@1000
    };
    
    NSInteger result = 0;
    NSInteger len = s.length;
    for (NSInteger i=0; i<len; i++) {
        NSInteger value = [symbols[[s substringWithRange:NSMakeRange(i, 1)]] integerValue];
        if (i<len-1 && value < [symbols[[s substringWithRange:NSMakeRange(i+1, 1)]] integerValue]) {
            result -= value;
        }else {
            result += value;
        }
    }
    
    return result;
}

@end

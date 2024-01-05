//
//  Number12.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/15.
//

#import "Number12.h"

@implementation Number12


//解法一
- (NSString *)intToRoman:(NSInteger)num {
    NSArray *valueSymbols = @[
        @{@1000:@"M"},
        @{@900:@"CM"},
        @{@500:@"D"},
        @{@400:@"CD"},
        @{@100:@"C"},
        @{@90:@"XC"},
        @{@50:@"L"},
        @{@40:@"XL"},
        @{@10:@"X"},
        @{@9:@"IX"},
        @{@5:@"V"},
        @{@4:@"IV"},
        @{@1:@"I"}
    ];
    
    NSString *result = @"";
    for (NSDictionary *dic in valueSymbols) {
        NSInteger key = [dic.allKeys.firstObject integerValue];
        NSString *symbol = [dic.allValues.firstObject stringValue];
        
        while (num >= key) {
            result = [result stringByAppendingString:symbol];
            num -= key;
        }
        
        if (num == 0) {
            break;
        }
    }
    
    return result;
}

//解法二
//- (NSString *)intToRoman:(NSInteger)num {
//    NSArray *thounds = @[@"", @"M", @"MM", @"MMM"];
//    NSArray *hundrand = @[@"", @"C", @"CC", @"CCC", @"CD", @"D", @"DC", @"DCC", @"DCCC", @"CM"];
//    NSArray * tens =@[@"", @"X", @"XX", @"XXX", @"XL", @"L", @"LX", @"LXX", @"LXXX", @"XC" ];
//    NSArray * ones = @[@"", @"I", @"II", @"III", @"IV", @"V", @"VI", @"VII", @"VIII", @"IX"];
//    
//    NSString *result = [[[thounds[num/1000] stringByAppendingString:hundrand[num % 1000 / 100]] stringByAppendingString:tens[num%100/10]] stringByAppendingString:ones[num%10]];
//    
//    return result;
//}
@end

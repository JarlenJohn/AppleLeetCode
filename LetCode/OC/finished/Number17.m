//
//  Number17.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/21.
//

#import "Number17.h"

@implementation Number17

//深度优先遍历
- (NSArray *)letterCombinations:(NSString *)digits {
    if (digits.length == 0) {
        return @[];
    }
    
    NSDictionary *phoneMap = @{
        @"2": @"abc", @"3": @"def", @"4": @"ghi", @"5": @"jkl",
        @"6": @"mno", @"7": @"pqrs", @"8": @"tuv", @"9": @"wxyz"
    };
    
    NSMutableArray *combinations = [NSMutableArray array];
    NSMutableString *combination = @"".mutableCopy;
    
    //回溯法
    [self backTrackWithCombinations:combinations
                combination:combination
                phoneMap:phoneMap
                             digits:digits
                              index:0];
    
    return combinations.copy;
}

- (void)backTrackWithCombinations:(NSMutableArray *)combinations
                      combination:(NSMutableString *)combination
                         phoneMap:(NSDictionary *)phoneMap
                           digits:(NSString *)digits
                            index:(NSInteger)index {
    if (index == digits.length) {
        [combinations addObject:combination.copy];
    }else {
        NSString *digit = [digits substringWithRange:NSMakeRange(index, 1)];
        NSString *letters = phoneMap[digit];
        if (letters.length > 0) {
            for (NSInteger i=0; i<letters.length; i++) {
                unichar charac = [letters characterAtIndex:i];
                NSString *str = [NSString stringWithCharacters:&charac length:1];
                
                [combination appendString:str];
                [self backTrackWithCombinations:combinations
                            combination:combination
                            phoneMap:phoneMap
                                         digits:digits
                                          index:index+1];
                [combination deleteCharactersInRange:NSMakeRange((combination).length-1, 1)];
            }
        }
    }
}

@end

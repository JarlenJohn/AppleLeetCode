//
//  Number30.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/5.
//

#import "Number30.h"

@implementation Number30

//滑动窗口法 + 哈希表
- (NSArray *)findSubstring:(NSString *)s words: (NSArray <NSString *>*)words {
    NSInteger m = words.count, n = words[0].length, ls = s.length;
    
    NSMutableArray *res = [NSMutableArray array];
    
    // 开始对s切片，由于模式字符串长度为n，则n为一个周期切片就不会重复出现，且考虑到了所有不同的切片模式
    for (NSInteger i=0; i<n; i++) {
        if (i + m * n > ls) {//滑动窗口超过了总长度，则终止
            break;
        }
        
        //用一个哈希表 differ表示窗口中单词频次和words中单词频次之差
        NSMutableDictionary *differ = [NSMutableDictionary dictionary];
        
        //将当前滑动窗口里的字符串计数值加1
        for (NSInteger j=0; j<m; j++) {
            NSString *word = [s substringWithRange:NSMakeRange(i+j*n, n)];
            differ[word] = @([differ[word] integerValue] + 1);
        }
        
        //将words中存在字符串计数值减1
        for (NSString *word in words) {
            differ[word] = @([differ[word] integerValue] - 1);
            if ([differ[word] integerValue] == 0) {
                [differ removeObjectForKey:word];
            }
        }
        
        //开始滑动窗口比对,以n为步进值
        for (NSInteger start = i; start < ls-m*n+1 ; start+=n) {
            if (start != i) {
                //右侧增加的一个字符串计数值加1
                NSString *word = [s substringWithRange:NSMakeRange(start+(m-1)*n, n)];
                differ[word] = @([differ[word] integerValue] + 1);
                if ([differ[word] integerValue] == 0) {
                    [differ removeObjectForKey:word];
                }
                
                //左侧移出去的字符串计数值减1
                word = [s substringWithRange:NSMakeRange(start-n, n)];
                differ[word] = @([differ[word] integerValue] - 1);
                if ([differ[word] integerValue] == 0) {
                    [differ removeObjectForKey:word];
                }
            }
            
            //窗口中单词频次和words中单词频次之差为0表示配对到了
            if (differ.allKeys.count == 0) {
                [res addObject:@(start)];
            }
        }
    }
    
    return res;
}

@end

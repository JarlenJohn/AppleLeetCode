//
//  Number22.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/25.
//

#import "Number22.h"

@interface Number22()

@property (nonatomic, strong) NSMutableArray *res;
@end


@implementation Number22

//生成n对括号
- (NSArray *)generateParenthesis:(NSInteger)n {
    
    [self.res removeAllObjects];
    
    //回溯法解决此问题
    [self backtrack:n right:0 str:@""];
    
    return self.res.copy;
}

- (void)backtrack:(NSInteger)left right:(NSInteger)right str:(NSString *)str {
    //定义边界
    if (!left && !right) {
        [self.res addObject:str];
    }
    
    if (left) {//当左半部分有值，右半部分增加1表示成对出现
        [self backtrack:left-1 right:right+1 str:[str stringByAppendingString:@"("]];
    }
    
    if (right) {//左边固定的情况下，右边可能的各种组合
        [self backtrack:left right:right-1 str:[str stringByAppendingString:@")"]];
    }
}

- (NSMutableArray *)res {
    if (!_res) {
        _res = [NSMutableArray array];
    }
    return _res;
}

@end

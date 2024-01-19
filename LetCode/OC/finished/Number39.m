//
//  Number39.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/19.
//

#import "Number39.h"

@implementation Number39

- (NSArray *)combinationSum:(NSArray *)candidates target:(NSInteger)target {
    NSMutableArray <NSArray <NSNumber *>*>*ans = [NSMutableArray array];
    NSMutableArray <NSNumber *>*combine = [NSMutableArray array];
    
    [self dfs:candidates targe:target ans:ans combine:combine idx:0];
    
    return ans;
}

- (void)dfs:(NSArray *)candidates
      targe:(NSInteger)target
        ans:(NSMutableArray *)ans 
    combine:(NSMutableArray *)combine
        idx:(NSInteger)idx {
    //定义递归终止条件
    if (idx == candidates.count) {
        return;
    }
    
    if (target == 0) {
        [ans addObject:combine];
        return;
    }
    
    //直接跳过，递归下一个
    [self dfs:candidates targe:target ans:ans combine:combine idx:idx+1];
    
    if (target - [candidates[idx] integerValue] >= 0) {
        [combine addObject:candidates[idx]];
        
        [self dfs:candidates targe:target-[candidates[idx] integerValue] ans:ans combine:combine idx:idx];
        
        [combine removeLastObject];
    }
}
    
@end

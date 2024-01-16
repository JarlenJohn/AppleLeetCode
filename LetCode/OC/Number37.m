//
//  Number37.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/16.
//

#import "Number37.h"

@implementation Number37 {
    NSMutableArray *_rows;
    NSMutableArray *_columns;
    NSMutableArray *_subbox;
    NSMutableArray *_space;
}

- (void)dfs:(NSMutableArray *)board pos:(NSInteger)pos valid:(BOOL *)valid {
    //判断是否到末尾了，到末尾则有解
    if (pos == _space.count) {
        *valid = YES;
        return;
    }
    
    NSInteger i = [[_space[pos] firstObject] integerValue];
    NSInteger j = [[_space[pos] lastObject] integerValue];
    
    for (NSInteger x=1; x<=9; x++) {
        if (!*valid && ![_rows[i][x-1] boolValue] && ![_columns[j][x-1] boolValue] && ![_subbox[i/3][j/3][x-1] boolValue]) {
            //将当前值填入i，j位置
            board[i][j] = [NSString stringWithFormat:@"%ld", x];
            
            //更新标记位
            _rows[i][x-1] = _columns[j][x-1] = _subbox[i/3][j/3][x-1] = @(true);
            
            //递归检查下一个空位置是否有解
            [self dfs:board pos:pos+1 valid:valid];
            
            //在无解情况下，回溯到当前递归层时，我们还要将上述的三个值重新置为 False
            _rows[i][x-1] = _columns[j][x-1] = _subbox[i/3][j/3][x-1] = @(false);
        }
    }
}

//解数独
- (void)solveSudoku:(NSMutableArray *)board {
    _rows = [NSMutableArray arrayWithCapacity:9];
    _columns = [NSMutableArray arrayWithCapacity:9];
    _subbox = [NSMutableArray arrayWithCapacity:3];
    _space = [NSMutableArray array];
    
    //填充数组
    for (NSInteger i=0; i<9; i++) {
        NSMutableArray *itemArr = [NSMutableArray array];
        for (NSInteger j=0; j<9; j++) {
            [itemArr addObject:@(false)];
        }
        [_rows addObject:itemArr];
    }
    for (NSInteger i=0; i<9; i++) {
        NSMutableArray *itemArr = [NSMutableArray array];
        for (NSInteger j=0; j<9; j++) {
            [itemArr addObject:@(false)];
        }
        [_columns addObject:itemArr];
    }
    for (NSInteger i=0; i<3; i++) {
        NSMutableArray *itemArr = [NSMutableArray array];
        for (NSInteger j=0; j<3; j++) {
            NSMutableArray *subItemArr = [NSMutableArray array];
            for (NSInteger k=0; k<9; k++) {
                [subItemArr addObject:@(false)];
            }
            [itemArr addObject:subItemArr];
        }
        [_subbox addObject:itemArr];
    }
    
    //先遍历数独，标记已存在的数据
    for (NSInteger i=0; i<9; i++) {
        for (NSInteger j=0; j<9; j++) {
            NSString *c = board[i][j];
            
            if ([c isEqualToString:@"."]) {
                [_space addObject:@[@(i), @(j)]];
            }else {
                NSInteger num = [c integerValue];
                
                _rows[i][num-1] = @(true);
                _columns[j][num-1] = @(true);
                _subbox[i/3][j/3][num-1] = @(true);
            }
        }
    }
    
    BOOL valid = false;
    
    [self dfs:board pos:0 valid:&valid];
}

@end

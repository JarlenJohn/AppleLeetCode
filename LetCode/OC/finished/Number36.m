//
//  Number36.m
//  LetCode
//
//  Created by JarlenJohn on 2024/1/12.
//

#import "Number36.h"

@implementation Number36

- (BOOL)isValidSudoku:(NSArray *)board {
    NSMutableArray *rows = [NSMutableArray arrayWithCapacity:9];
    for (NSInteger i=0; i<9; i++) {
        
        NSMutableArray *itemArr = [NSMutableArray array];
        for (NSInteger j=0; j<9; j++) {
            [itemArr addObject:@(0)];
        }
        [rows addObject:itemArr];
    }
    
    NSMutableArray *columns = [NSMutableArray arrayWithCapacity:9];
    for (NSInteger i=0; i<9; i++) {
        NSMutableArray *itemArr = [NSMutableArray array];
        for (NSInteger j=0; j<9; j++) {
            [itemArr addObject:@(0)];
        }
        [columns addObject:itemArr];
    }
    
    NSMutableArray *subbox = [NSMutableArray arrayWithCapacity:3];
    for (NSInteger i=0; i<3; i++) {
        NSMutableArray *itemArr = [NSMutableArray array];
        for (NSInteger j=0; j<3; j++) {
            NSMutableArray *subItemArr = [NSMutableArray array];
            for (NSInteger k=0; k<9; k++) {
                [subItemArr addObject:@(0)];
            }
            [itemArr addObject:subItemArr];
        }
        [subbox addObject:itemArr];
    }
    
    for (NSInteger i=0; i<9; i++) {
        for (NSInteger j=0; j<9; j++) {
            NSString *c = board[i][j];
            
            if (![c isEqualToString:@"."]) {
                NSInteger idx = [c integerValue];
                
                rows[i][idx] = @([rows[i][idx] integerValue] + 1);
                columns[j][idx] = @([columns[j][idx] integerValue] + 1);
                subbox[i/3][j/3][idx] = @([subbox[i/3][j/3][idx] integerValue] + 1);
                
                if ([rows[i][idx] integerValue] > 1 || [columns[j][idx] integerValue] > 1 ||
                    [subbox[i/3][j/3][idx] integerValue] > 1) {
                    return NO;
                }
            }
        }
    }
    
    return YES;
}

@end

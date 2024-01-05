//
//  Number10.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/8.
//

#import "Number10.h"

@implementation Number10

- (BOOL)matchStr:(NSString *)s pStr:(NSString *)p {
    NSInteger m = s.length;
    NSInteger n = p.length;
    
    BOOL (^matches)(NSInteger, NSInteger) = ^BOOL(NSInteger i, NSInteger j) {
        if (i == 0) {
            return NO;
        }
        
        if ([p characterAtIndex:j-1] == '.') {
            return YES;
        }
        
        return [s characterAtIndex:i-1] == [p characterAtIndex:j-1];
    };
    
    //构造状态转移表
    NSMutableArray *f = [[NSMutableArray alloc] initWithCapacity:m+1];
    for (NSInteger i=0; i<m+1; i++) {
        NSMutableArray *subArr = [[NSMutableArray alloc] initWithCapacity:n+1];
        for (NSInteger j=0; j<n+1; j++) {
            subArr[j] = @(0);
        }
        f[i] = subArr;
    }
    
    f[0][0] = @(1);
    
    for (NSInteger i=0; i<=m; i++) {
        for (NSInteger j=1; j<=n; j++) {
            if ([p characterAtIndex:j-1] == '*') {
                f[i][j] = @([f[i][j] intValue] | [f[i][j-2] intValue]);
                
                if (matches(i, j-1)) {
                    f[i][j] = @([f[i][j] intValue] | [f[i-1][j] intValue]);
                }
            }else {
                if (matches(i, j)) {
                    f[i][j] = @([f[i][j] intValue] | [f[i-1][j-1] intValue]);
                }
            }
        }
    }
    
    return [f[m][n] boolValue];
    
    return false;
}

@end

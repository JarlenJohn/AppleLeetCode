//
//  main.m
//  LetCode
//
//  Created by JarlenJohn on 2023/11/14.
//

#import <Foundation/Foundation.h>
#import "Number32.h"

#import <LetCode-Swift.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        SwiftNumber32 *obj = [[SwiftNumber32 alloc] init];
//        [obj test];
        
        Number32 *obj = [[Number32 alloc] init];
        NSInteger res = [obj longestValidParentheses:@")()())"];
        NSLog(@"res = %ld", res);
    }
    return 0;
}

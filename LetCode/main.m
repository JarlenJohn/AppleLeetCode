//
//  main.m
//  LetCode
//
//  Created by JarlenJohn on 2023/11/14.
//

#import <Foundation/Foundation.h>
#import "Number33.h"

#import <LetCode-Swift.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        SwiftNumber33 *obj = [[SwiftNumber33 alloc] init];
//        [obj test];
        
        Number33 *obj = [[Number33 alloc] init];
        
        NSArray *nums = @[@5, @1, @3];
        NSInteger res = [obj search:nums target:3];
        NSLog(@"res = %ld", res);
    }
    return 0;
}

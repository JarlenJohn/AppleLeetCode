//
//  main.m
//  LetCode
//
//  Created by JarlenJohn on 2023/11/14.
//

#import <Foundation/Foundation.h>
#import "Number31.h"

#import <LetCode-Swift.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        SwiftNumber31 *obj = [[SwiftNumber31 alloc] init];
//        [obj test];
        
        Number31 *obj = [[Number31 alloc] init];
        
        NSMutableArray *nums = @[@3, @2, @1].mutableCopy;
        [obj nextPermutation:nums];
        for (NSNumber *num in nums) {
            NSLog(@"%ld, ", [num integerValue]);
        }
    }
    return 0;
}

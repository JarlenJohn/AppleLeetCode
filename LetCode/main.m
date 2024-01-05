//
//  main.m
//  LetCode
//
//  Created by JarlenJohn on 2023/11/14.
//

#import <Foundation/Foundation.h>
#import "Number30.h"

#import <LetCode-Swift.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Number30 *obj = [[Number30 alloc] init];
        
        NSArray *res = [obj findSubstring:@"barfoothefoobarman" words:@[@"foo",@"bar"]];
        for (NSNumber *num in res) {
            NSLog(@"%ld, ", [num integerValue]);
        }
        
//        SwiftNumber30 *obj = [[SwiftNumber30 alloc] init];
//        [obj test];
    }
    return 0;
}

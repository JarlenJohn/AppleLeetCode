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
        SwiftNumber38 *obj = [[SwiftNumber38 alloc] init];
        NSString *res = [obj countAndSay:4];
        NSLog(@"%@", res);
    }
    return 0;
}

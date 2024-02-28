//
//  main.m
//  LetCode
//
//  Created by JarlenJohn on 2023/11/14.
//

#import <Foundation/Foundation.h>
#import "Number43.h"

#import <LetCode-Swift.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        SwiftNumber43 *obj = [[SwiftNumber43 alloc] init];
//        [obj test];
        
        Number43 *obj = [[Number43 alloc] init];
        NSString *res = [obj multiply:@"2" num2:@"3"];
        NSLog(@"res = %@", res);
    }
    return 0;
}

//
//  Number14.h
//  LetCode
//
//  Created by JarlenJohn on 2023/12/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Number14 : NSObject

/* 测试代码
 
 Number14 *obj = [Number14 new];
 
 NSArray *test1 = @[@"flower",@"flow",@"flight"];
 if ([[obj longestCommonPrefix:test1]  isEqualToString:@"fl"]) {
     NSLog(@"测试用例1通过");
 }
 
 NSArray *test2 = @[@"dog",@"racecar",@"car"];
 if ([[obj longestCommonPrefix:test2]  isEqualToString:@""]) {
     NSLog(@"测试用例2通过");
 }
 
 NSArray *test3 = @[@"a"];
 if ([[obj longestCommonPrefix:test3]  isEqualToString:@"a"]) {
     NSLog(@"测试用例3通过");
 }
 */

-(NSString *)longestCommonPrefix:(NSArray <NSString *>*)strs;

@end

NS_ASSUME_NONNULL_END

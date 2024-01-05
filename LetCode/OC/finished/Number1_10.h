//
//  Number1.h
//  LetCode
//
//  Created by JarlenJohn on 2023/11/14.
//

#import <Foundation/Foundation.h>
#import "ListNodeOC.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, StateEnum) {
    StateEnumStart = 0,
    StateEnumSigned = 1,
    StateEnumInNumber = 2,
    StateEnumEnd
};

@interface Number1_10 : NSObject


/**
 *  给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
 *  你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
 *  你可以按任意顺序返回答案。
 */
- (NSArray *)twoSum:(NSArray <NSNumber *>*)nums target:(NSInteger)target;



/**
 *  给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 *  请你将两个数相加，并以相同形式返回一个表示和的链表。
 *  你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 */
- (ListNodeOC *)addTwoNumber:(ListNodeOC *)l1 listNode2:(ListNodeOC *)l2;



/*
 Number3 *numb3 = [Number3 new];
 
 NSString *test1 = @"dvdf";
 NSInteger len =  [numb3 lengthOfLongestSubstring:test1];
 NSLog(@"len = %ld", len);
 */
- (NSInteger)lengthOfLongestSubstring:(NSString *)s;


//4
- (CGFloat)findMedianSortedArraysWithNums1:(NSArray *)num1 nums2: (NSArray *)num2;

//5
- (NSString *)longestPalindrome:(NSString *)s;

//6
- (NSString *)convert:(NSString *)s numRows:(NSInteger)numRows;

//7
-(int)reverse:(int)x;

//8
- (int)myAtoi:(NSString *)s;

//9
- (BOOL)isPalindrome:(NSInteger)s;


@end


/// 有限状态机 FSM
@interface Automation : NSObject

@property (nonatomic, assign) int flagV; // 1 / -1

@property (nonatomic, assign) int num;

- (void)getChar:(unichar)character;

- (int)getFixedresult;

@end


NS_ASSUME_NONNULL_END

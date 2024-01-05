//
//  ListNode.h
//  LetCode
//
//  Created by JarlenJohn on 2023/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNodeOC : NSObject

@property (nonatomic, assign) NSInteger val;

@property (nonatomic, strong) ListNodeOC *next;

- (instancetype)initWithVal:(NSInteger)val;
- (instancetype)initWithVal:(NSInteger)val next:(ListNodeOC *)next;

@end

NS_ASSUME_NONNULL_END

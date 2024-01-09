//
//  StackOC.h
//  LetCode
//
//  Created by JarlenJohn on 2023/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StackOC<__covariant T> : NSObject

- (void)push:(T)t;
- (T)pop;
- (T)top;
- (void)cleanAll;
- (BOOL)empty;

@end

NS_ASSUME_NONNULL_END

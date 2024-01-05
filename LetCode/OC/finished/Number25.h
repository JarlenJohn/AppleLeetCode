//
//  Number25.h
//  LetCode
//
//  Created by JarlenJohn on 2023/12/29.
//

#import <Foundation/Foundation.h>
#import "ListNodeOC.h"


NS_ASSUME_NONNULL_BEGIN

@interface Number25 : NSObject

- (ListNodeOC *)reverseKGroup:(ListNodeOC *)head
                      inteval:(NSInteger)k;
@end

NS_ASSUME_NONNULL_END

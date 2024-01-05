//
//  Number206.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/29.
//

#import "Number206.h"

@implementation Number206

//方法一、迭代
//-(ListNodeOC *)reverseList:(ListNodeOC *)head {
//    ListNodeOC *pre = nil;
//    ListNodeOC *cur = head;
//    
//    while (cur != nil) {
//        ListNodeOC *nex = cur.next;
//        cur.next = pre;
//        pre = cur;
//        cur = nex;
//    }
//    
//    return pre;
//}

//递归法
-(ListNodeOC *)reverseList:(ListNodeOC *)head {
    //递归终止条件
    if (!head || !head.next) {
        return head;
    }

    ListNodeOC *next = head.next;
    ListNodeOC *newHead = [self reverseList:next];
    
    next.next = head;
    head.next = nil;
    
    return newHead;
}

@end

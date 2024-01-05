//
//  Number25.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/29.
//

#import "Number25.h"

@implementation Number25

- (NSArray *)reverseListNode:(ListNodeOC *)head tail:(ListNodeOC *)tail {
    ListNodeOC *previ = tail.next;
    ListNodeOC *p = head;
    
    while (previ != tail) {
        ListNodeOC *nex = p.next;
        p.next = previ;
        previ = p;
        p = nex;
    }
    
    return @[tail, head];
}

- (ListNodeOC *)reverseKGroup:(ListNodeOC *)head
                      inteval:(NSInteger)k {
    //创建哑巴节点
    ListNodeOC *dummyNode = [[ListNodeOC alloc] initWithVal:0];
    dummyNode.next = head;
    ListNodeOC *p = dummyNode;
    
    while (head != nil) {
        ListNodeOC *tail = p;
        
        for (NSInteger i=0; i<k; i++) {
            tail = tail.next;
            if (!tail) {
                return dummyNode.next;
            }
        }
        
        ListNodeOC *pre = tail.next;
        
        NSArray *result = [self reverseListNode:head tail:tail];
        head = result.firstObject;
        tail = result.lastObject;
        
        //链接首尾顺序
        p.next = head;
        tail.next = pre;
        p = tail;
        head = pre;
    }
    return dummyNode.next;
}

@end

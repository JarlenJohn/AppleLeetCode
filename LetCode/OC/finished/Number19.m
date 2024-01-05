//
//  Number19.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/22.
//

#import "Number19.h"
#import "StackOC.h"


@implementation Number19

- (NSInteger)lenOfListNode:(ListNodeOC *)listNode {
    NSInteger len = 0;
    ListNodeOC *cur = listNode;
    while (cur) {
        len++;
        cur = cur.next;
    }
    return len;
}

////计算链表长度, 删除l-n+1的位置
- (ListNodeOC *)removeNthFromEnd:(ListNodeOC *)head atReverseIdx:(NSInteger)n {
    //构造虚拟头节点
    ListNodeOC *dummyNode = [[ListNodeOC alloc] initWithVal:0 next:head];
    NSInteger len = [self lenOfListNode:head];

    ListNodeOC *cur = dummyNode;
    for (NSInteger i=1; i<len-n+1; i++) {
        cur = cur.next;
    }

    cur.next = cur.next.next;

    return dummyNode.next;
}

//栈
//- (ListNodeOC *)removeNthFromEnd:(ListNodeOC *)head atReverseIdx:(NSInteger)n {
//
//    ListNodeOC *dummyNode = [[ListNodeOC alloc] initWithVal:0 next:head];
//    StackOC *stack = [[StackOC alloc] init];
//
//    //先入栈
//    ListNodeOC *cur = dummyNode;
//    while (cur) {
//        [stack push:cur];
//        cur = cur.next;
//    }
//
//    //出栈n个元素
//    for (NSInteger i=0; i<n; i++) {
//        [stack pop];
//    }
//
//    //删除最后一个元素
//    cur = [stack top];
//    cur.next = cur.next.next;
//
//    [stack cleanAll];
//
//    return dummyNode.next;
//}


//双指针解法
//- (ListNodeOC *)removeNthFromEnd:(ListNodeOC *)head atReverseIdx:(NSInteger)n {
//    ListNodeOC *dummyNode = [[ListNodeOC alloc] initWithVal:0 next:head];
//    
//    ListNodeOC *firstNode = dummyNode;
//    ListNodeOC *secondNode = dummyNode;
//    
//    //先移动指针，让两个指针差值为n
//    for (NSInteger i=0; i<n; i++) {
//        secondNode = secondNode.next;
//    }
//    
//    //同时移动两个指针，当第二个指针指向最后一个元素的时候，第一个指针指向的正是倒数第n个元素
//    while (secondNode.next) {
//        firstNode = firstNode.next;
//        secondNode = secondNode.next;
//    }
//    
//    firstNode.next = firstNode.next.next;
//    
//    return dummyNode.next;
//}

@end

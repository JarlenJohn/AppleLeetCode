//
//  Number24.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/27.
//

#import "Number24.h"

@implementation Number24

 //递归法
//- (ListNodeOC * _Nullable)swapPairs:(ListNodeOC * _Nullable)head {
//    //递归终止条件
//    if (!head.next || !head.next.next) {
//        return head
//    }
//    
//    ListNodeOC *freshHead = [ListNodeOC alloc] initWithVal:0];
//    while(head.next && head.next.next) {
//        head.next = swapPairs(freshHead.next);
//        freshHead.next = head;
//    }
//    
//    return freshHead;
//}

//迭代法
- (ListNodeOC * _Nullable)swapPairs:(ListNodeOC * _Nullable)head {
    //build dummy node
    ListNodeOC *dummyNode = [[ListNodeOC alloc] initWithVal:0];
    dummyNode.next = head;
    
    ListNodeOC *tempNode = dummyNode;
    while(tempNode.next && tempNode.next.next) {
        ListNodeOC *fir = tempNode.next;
        ListNodeOC *sec = tempNode.next.next;
        
        tempNode.next = sec;
        fir.next = sec.next;
        sec.next = fir;
        
        tempNode = fir;
    }
    
    return dummyNode.next;
}
@end

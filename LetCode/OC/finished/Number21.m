//
//  Number21.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/25.
//

#import "Number21.h"

@implementation Number21

/*
 首先回想解决链表问题的三把斧
 ·哑巴节点
 ·栈
 ·快慢指针
 
 此题有用到哑巴节点
 */

//回溯法
//- (ListNodeOC * _Nullable)mergeTwoLists:(ListNodeOC * _Nullable)list1
//                        list2:(ListNodeOC * _Nullable)list2 {
//    if (!list1) {
//        return list2;
//    }
//    if (!list2) {
//        return list1;
//    }
//    
//    ListNodeOC *dummyNode = [[ListNodeOC alloc] initWithVal:-1];
//    ListNodeOC *pre = dummyNode;
//    
//    while (list1 && list2) {
//        if (list1.val < list2.val) {
//            pre.next = list1;
//            list1 = list1.next;
//        }else {
//            pre.next = list2;
//            list2 = list2.next;
//        }
//        
//        pre = pre.next;
//    }
//    
//    pre.next = list1 ? list1 : list2;
//    
//    return dummyNode.next;
//}

//递归法
- (ListNodeOC * _Nullable)mergeTwoLists:(ListNodeOC * _Nullable)list1
                                  list2:(ListNodeOC * _Nullable)list2 {
    //递归终止条件
    if (!list1) {
        return list2;
    }
    if (!list2) {
        return list1;
    }
    
    if (list1.val < list2.val) {
        list1.next = [self mergeTwoLists:list1.next list2:list2];
        return list1;
    }else {
        list2.next = [self mergeTwoLists:list1 list2:list2.next];
        return list2;
    }
}

@end

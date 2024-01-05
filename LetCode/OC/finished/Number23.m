//
//  Number23.m
//  LetCode
//
//  Created by JarlenJohn on 2023/12/26.
//

#import "Number23.h"

@implementation Number23

//顺序合并
//- (ListNodeOC * _Nullable) mergeKLists:(NSArray <ListNodeOC *>*)lists {
//    if (lists.count <= 0) {
//        return nil;
//    }
//
//    ListNodeOC *ans = nil;
//    for (NSInteger i=0; i<lists.count; i++) {
//        ans = [self mergeTwoList:ans list2:lists[i]];
//    }
//    return ans;
//}

- (ListNodeOC * _Nullable) merge:(NSArray <ListNodeOC *>*)lists left:(NSInteger)left right:(NSInteger)right {
    if (left == right) {
        return lists[left];
    }
    
    if (left > right) {
        return nil;
    }
    
    NSInteger mid = (left+right) / 2;
    return [self mergeTwoList:[self merge:lists left:left right:mid] list2:[self merge:lists left:mid+1 right:right]];
}

//分治合并
- (ListNodeOC * _Nullable) mergeKLists:(NSArray <ListNodeOC *>*)lists {
    return [self merge:lists left:0 right:lists.count-1];
}

- (ListNodeOC * _Nullable)mergeTwoList:(ListNodeOC * _Nullable)list list2:(ListNodeOC * _Nullable)list2 {
    if (!list || !list2) {
        return list ? list : list2;
    }
    
    //构造哑巴节点
    ListNodeOC *dummyNode = [[ListNodeOC alloc] initWithVal:-1];
    ListNodeOC *prev = dummyNode;
    while (list && list2) {
        if (list.val < list2.val) {
            prev.next = list;
            list = list.next;
        }else {
            prev.next = list2;
            list2 = list2.next;
        }
        
        prev = prev.next;
    }
    
    //将任意一个剩余的部分拼接起来
    prev.next = list ? list : list2;
    
    return dummyNode.next;
}

@end

//
//  SwiftNumber23.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/26.
//

import Foundation

@objc class SwiftNumber23 : NSObject {
    
    @objc func test() {
        var testArr = [ListNode]()
        let node1 = ListNode(-2)
        
        let node21 = ListNode(1)
        let node22 = ListNode(-2, node21);
        let node23 = ListNode(-3, node22)
        
        testArr.append(node1)
        testArr.append(node23)
        
//        var res = mergeTwoListNode(node1, node23)
        var res = mergeKLists(testArr)
        while let result = res {
            print(result.val)
            res = result.next
        }
    }
    
    
    //合并两个有序链表函数
    func mergeTwoListNode(_ list1: ListNode?, _ list2:ListNode?) -> ListNode? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }
        
        //构造哑巴节点
        let dummyNode = ListNode(-1);
        var pre:ListNode? = dummyNode;
        
        var list1 = list1
        var list2 = list2
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                pre?.next = list1!;
                list1 = list1?.next;
            }else {
                pre?.next = list2
                list2 = list2?.next
            }
            pre = pre?.next
        }
        
        pre?.next = list1 != nil ? list1 : list2
        
        return dummyNode.next
    }
    
    //之前已有两两合并有序链表，能否利用起来呢？
    //朴素解法，利用之前已经实现的两个有序链表的合并算法
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        let cnt = lists.count
//        guard cnt > 0 else {return nil}
//        
//        
//        var ans:ListNode?
//        for i in 0..<cnt {
//            ans = mergeTwoListNode(ans, lists[i])
//        }
//        
//        return ans
//    }
    
    //分治合并
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        func merge(_ lists: [ListNode?], _ left: Int, _ right:Int) -> ListNode? {
            if left == right {
                return lists[left]
            }
            
            if left > right { return nil }
            
            let mid = (left + right) >> 1
            return mergeTwoListNode(merge(lists, left, mid), merge(lists, mid+1, right))
        }
        
        return merge(lists, 0, lists.count-1)
    }
}

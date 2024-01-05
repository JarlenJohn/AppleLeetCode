//
//  SwiftNumber21.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/25.
//

import Foundation

class SwiftNuber21 {
    //迭代法
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        guard list1 != nil else {
//            return list2
//        }
//        
//        guard list2 != nil else {
//            return list1
//        }
//        
//        var list1 = list1
//        var list2 = list2
//        
//        let dummyNode = ListNode(-1);
//        var prev:ListNode? = dummyNode
//        
//        while list1 != nil && list2 != nil {
//            if list1!.value < list2!.value {
//                prev?.next = list1
//                list1 = list1!.next
//            }else {
//                prev?.next = list2
//                list2 = list2!.next
//            }
//            prev = prev?.next
//        }
//        
//        prev?.next = (list1 != nil) ? list1 : list2
//        
//        return dummyNode.next
//    }
    
    //递归法
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }
        
        if list1.val < list2.val {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        }else {
            list2.next = mergeTwoLists(list1, list2.next)
            return list2
        }
    }
}

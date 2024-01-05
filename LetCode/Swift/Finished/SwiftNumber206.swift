//
//  SwiftNumber206.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/29.
//

import Foundation

@objc class SwiftNumber206 : NSObject {
    
    //模拟法
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        //找出tail
//        var tail:ListNode? = head
//        var p = head
//        while p?.next != nil {
//            tail = p?.next
//            p = p?.next
//        }
//        
//        var previNode:ListNode? = tail?.next
//        p = head
//        
//        while previNode !== tail {
//            let nex = p?.next
//            p?.next = previNode
//            previNode = p
//            p = nex
//        }
//        
//        return tail
//    }
    
    @objc func test() {
        let node5 = ListNode(5)
        let node4 = ListNode(4, node5);
        let node3 = ListNode(3, node4);
        let node2 = ListNode(2, node3);
        let node = ListNode(1, node2);
        
        var result = reverseList(node)
        while let res = result {
            print(res.val)
            result = res.next
        }
    }
    
    
    //迭代法
    func reverseList(_ head: ListNode?) -> ListNode? {
        var previ: ListNode?
        var cur = head
        
        while cur != nil {
            let nex = cur?.next
            cur?.next = previ
            previ = cur
            cur = nex
        }
        
        return previ
    }
    
    //递归法
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        // 递归终止条件
//        if head == nil || head?.next == nil {
//            return head
//        }
//        
//        let next = head?.next
//        let node = reverseList(next)
//        head?.next = nil
//        next?.next = head
//        return node
//    }
}

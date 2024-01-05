//
//  SwfitNumber25.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/28.
//

import Foundation

@objc class SwiftNumber25 : NSObject {
    
    @objc func test() {
        //[1,2,3,4,5], 2
        let node5 = ListNode(5)
        let node4 = ListNode(4, node5);
        let node3 = ListNode(3, node4);
        let node2 = ListNode(2, node3);
        let node = ListNode(1, node2);
        
        var result = reverseKGroup(node, 3)
        
        while let res = result {
            print(res.val)
            result = res.next
        }
    }
    
    //翻转链表，返回新的头和尾
    func reverseListNode(_ head:ListNode?, _ tail:ListNode?) -> (ListNode?, ListNode?) {
        //记录未反转时最后一个元素的下一个，反转后保持链接状态
        var nextNode = tail?.next
        var p = head
        
        while nextNode !== tail {
            let nex = p?.next
            p?.next = nextNode
            nextNode = p
            p = nex
        }
        
        return (tail, head)
    }
    
    
    //k个一组翻转链表
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummyNode = ListNode(0)
        dummyNode.next = head
        var p:ListNode? = dummyNode
        
        var head = head
        while head != nil {
            var tail:ListNode? = p
            
            for _ in 0..<k {
                tail = tail?.next
                guard tail != nil else {return dummyNode.next}
            }
            
            let nex = tail?.next
            let result = reverseListNode(head, tail)
            head = result.0
            tail = result.1
            
            var res = head
            while let result = res {
                print(result.val)
                res = result.next
            }
            
            //链接反转后的链表
            p?.next = head
            tail?.next = nex
            p = tail
            head = nex
        }
        return dummyNode.next
    }
}

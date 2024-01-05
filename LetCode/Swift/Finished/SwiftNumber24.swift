//
//  SwiftNumber24.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/27.
//

import Foundation

@objc class SwiftNumber24 : NSObject {
    @objc func test() {
        let node4 = ListNode(4)
        let node3 = ListNode(3, node4)
        let node2 = ListNode(2, node3);
        let node1 = ListNode(1, node2);
        
        var res = swapPairs(node1)
        while let result = res {
            print(result.val)
            res = result.next
        }
    }
    
    //两两交换链表的节点
//    func swapPairs(_ head: ListNode?) -> ListNode? {
//        //递归实现，抽象
//        //终止条件就是当结束or只剩一个时，终止
//        if head == nil || head?.next == nil {
//            return head
//        }
//        
//        /*
//         ***a     b     c
//         ***^     ^     ***********
//         ***|     |     ****************
//         * head *newHead****************
//         */
//        let newHead:ListNode? = head?.next
//        
//        head?.next = swapPairs(newHead?.next)
//        newHead?.next = head
//        
//        return newHead
//    }
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        //迭代法
        
        //哑巴节点
        let dummyNode = ListNode(0)
        dummyNode.next = head;
        
        var tempNode:ListNode? = dummyNode
        
        while tempNode?.next != nil && tempNode?.next?.next != nil {
            let fir = tempNode?.next
            let sec = tempNode?.next?.next
            //1->3
            fir?.next = sec?.next
            //2->1
            sec?.next = fir
            //temp->next -> sec
            tempNode?.next = sec
            
            //update tempNode pointer
            tempNode = fir
        }
        
        return dummyNode.next
    }
}

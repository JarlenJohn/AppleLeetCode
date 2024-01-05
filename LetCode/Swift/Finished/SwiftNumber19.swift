//
//  SwiftNumber19.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/22.
//

import Foundation

@objc class ListNode: NSObject {
    public var val:Int
    public var next: ListNode?
    
    override init() {
        self.val = 0
        self.next = nil
    }
    
    init(_ val:Int) {
        self.val = val
        self.next = nil
    }
    
    init(_ val:Int, _ next:ListNode?) {
        self.val = val
        self.next = next
    }
}

class Stack<T> : NSObject {
    private var items :[T]
    
    override init() {
        items = [T]();
    }
    
    public func push(_ t: T) {
        items.append(t)
    }
    
    public func pop() -> T {
        return items.removeLast()
    }
    
    func count() -> Int {
        return items.count
    }
    
    func clean() {
        items.removeAll()
    }
    
    func top() -> T? {
        return items.last
    }
}


@objc class SwiftNumber19 : NSObject {
    @objc func test() {
        //[1,2,3,4,5], 2
        let node5 = ListNode(5)
        let node4 = ListNode(4, node5);
        let node3 = ListNode(3, node4);
        let node2 = ListNode(2, node3);
        let node = ListNode(1, node2);
        
        let res = self.removeNthFromEnd(node, 2)
        
        var current:ListNode? = res
        while let cur = current {
            print(cur.val)
            current = current?.next
        }
    }
    
//    //入栈后弹栈n次即可
//    @objc func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        
//        //构造影子节点
//        let fickNode = ListNode(0)
//        fickNode.next = head
//        
//        let stack = Stack<ListNode>()
//        
//        var cur:ListNode? = fickNode
//        while let currentNode = cur {
//            stack.push(currentNode)
//            cur = currentNode.next
//        }
//        
//        for _ in 0..<n {
//            let _ = stack.pop()
//        }
//        
//        if let preNode = stack.top() {
//            preNode.next = preNode.next?.next
//        }
//        
//        return fickNode.next
//    }
    
    //双指针思想
//    @objc func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        //构造影子节点，为指针操作预留空间
//        let dummyNode = ListNode(0, head)
//        
//        var first:ListNode? = dummyNode
//        var second:ListNode? = dummyNode
//        
//        var current:ListNode? = dummyNode
//        for _ in 0..<n {
//            if let cur = current {
//                second = cur.next
//                current = second
//            }
//        }
//        
//        //同时移动两个指针,直至2到达结尾
//        while let _ = current?.next {
//            first = first?.next
//            second = second?.next
//            current = second
//        }
//        
//        first?.next = first?.next?.next
//        
//        return dummyNode.next
//    }
    
    //计算链表长度, 删除l-n+1的位置
    @objc func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyNode = ListNode(0, head);
        let len = getLenOfListNode(head)
        
        var current:ListNode? = dummyNode
        for _ in 1..<len-n+1 {
            current = current?.next
        }
        
        current?.next = current?.next?.next
        //MRC Or ARC？被释放的节点内存需要处理吗？
        
        let ans = dummyNode.next
        return ans
    }
    
    func getLenOfListNode(_ listNode:ListNode?) -> Int {
        var len = 0
        var current = listNode
        while let cur = current {
            current = cur.next
            len += 1
        }
        return len
    }
}

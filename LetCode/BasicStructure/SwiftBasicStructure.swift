//
//  SwiftBasicStructure.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/9.
//

import Foundation

class ListNode {
    public var val:Int
    public var next: ListNode?
    
    init() {
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

class Stack<T> {
    private var items :[T]
    
    init() {
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
    
    func empty() -> Bool {
        return items.count == 0 ? true : false
    }
}

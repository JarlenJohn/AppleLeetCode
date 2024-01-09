//
//  SwiftNumber32.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/9.
//

import Foundation

@objc class SwiftNumber32 : NSObject {
    
    @objc func test() {
        let s = ")()())"
        let res = longestValidParentheses(s)
        print(res)
    }
    
    //动态规划暂不考虑
    
//    func longestValidParentheses(_ s: String) -> Int {
//        let cnt = s.count
//        
//        var res:Int = 0
//        
//        //栈，存放[最后一个没有被匹配的右括号的下标]
//        let stack = Stack<Int>()
//        stack.push(-1)//为了统一期间，假数据填充
//
//        for i in 0..<cnt {
//            let chara = s[s.index(s.startIndex, offsetBy: i)]
//            if chara == "(" {
//                stack.push(i)
//            }else if(chara == ")") {
//                let _ = stack.pop()
//                
//                if stack.count() == 0 {
//                    stack.push(i)
//                }else {
//                    res = max(res, i - (stack.top() ?? 0))
//                }
//            }
//        }
//        return res
//    }
    
    //双指针法，空间复杂度为O(1)
    func longestValidParentheses(_ s: String) -> Int {
        let cnt = s.count
        
        var left = 0, right = 0, maxLen = 0
        
        //从左向右找一次
        for i in 0..<cnt {
            let str = s[s.index(s.startIndex, offsetBy: i)]
            if str == "(" {
                left += 1
            }else if(str == ")") {
                right += 1
            }
            
            if left == right {
                maxLen = max(maxLen, 2*right)
            }else if(right > left) {
                left = 0
                right = 0
            }
        }
        
        //从右向左找一次
        left = 0; right = 0
        var j = cnt - 1
        while j > 0 {
            let str = s[s.index(s.startIndex, offsetBy: j)]
            
            if str == "(" {
                left += 1
            }else if(str == ")") {
                right += 1
            }
            
            if left == right {
                maxLen = max(maxLen, 2*right)
            }else if(left > right) {
                left = 0
                right = 0
            }
            
            j -= 1
        }
        
        return maxLen
    }
}

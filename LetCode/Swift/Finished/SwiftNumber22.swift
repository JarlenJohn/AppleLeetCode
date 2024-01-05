//
//  SwiftNuber22.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/25.
//

import Foundation

class SwiftNuber22 {
    func generateParenthesis(_ n: Int) -> [String] {
        
        var res:[String] = [String]()
        
        func backtrack(left:Int, right:Int, str:String) {
            if left == 0 && right == 0 {
                res.append(str)
                return
            }
            
            if left > 0 {//当左半部分有值，右半部分增加1表示成对出现
                backtrack(left: left-1, right: right+1, str: str+"(")
            }
            
            if right > 0 {//左边固定的情况下，右边可能的各种组合
                backtrack(left: left, right: right-1, str: str+")")
            }
        }
        
        backtrack(left: n, right: 0, str: "")
        return res
    }
}

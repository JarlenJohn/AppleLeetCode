//
//  SwiftNumbe14.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/18.
//

import Foundation

@objc class SwiftNumbe14 : NSObject {
    //竖向扫描法
//    @objc func longestCommonPrefix(_ strs: [String]) -> String {
//        guard let firstStr = strs.first, !firstStr.isEmpty else { return "" }
//        
//        for i in 0..<firstStr.count {
//            for j in 1..<strs.count {
//                if strs[j].count == i || strs[j][strs[j].index(strs[j].startIndex, offsetBy: i)] != firstStr[firstStr.index(firstStr.startIndex, offsetBy: i)] {
//                    return String(firstStr.prefix(i))
//                }
//            }
//        }
//        
//        return firstStr
//    }
    
    
    //首尾比较法
    @objc func longestCommonPrefix(_ strs: [String]) -> String {
        let strs = strs.sorted()
        
        let start = strs.first!
        let end = strs.last!
        
        var res = ""
        for i in 0..<start.count {
            let s = start[start.index(start.startIndex, offsetBy: i)]
            if s == end[end.index(end.startIndex, offsetBy: i)]{
                res.append(s)
            }else {
                break
            }
        }
        return res
    }
}

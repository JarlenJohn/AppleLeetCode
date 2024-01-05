//
//  SwiftNumber28.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/2.
//

import Foundation

@objc class SwiftNumbe28 : NSObject {
    
    @objc func test() {
        let res = strStr("leetcode", "leeto")
        print(res)
    }
    
    //暴力法
//    func strStr(_ haystack: String, _ needle: String) -> Int {
//        
//        let cntL = haystack.count
//        let cntR = needle.count
//        
//        var i = 0
//        while i+cntR <= cntL {
//            var flag = true
//            
//            for j in 0..<cntR {
//                if haystack[haystack.index(haystack.startIndex, offsetBy: i+j)] != needle[needle.index(needle.startIndex, offsetBy: j)] {
//                    flag = false
//                    break
//                }
//            }
//            
//            if flag {
//                return i
//            }
//            
//            i += 1
//        }
//        
//        return -1
//    }
    
    //KMP 解法
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let n = haystack.count
        let m = needle.count
        if m == 0 {
            return 0
        }
        
        //构造next数组
        var pi = Array(repeating: 0, count: m+1)
        
        var j = 0
        for i in 1..<m {
            while j > 0 && needle[needle.index(needle.startIndex, offsetBy: i)] != needle[needle.index(needle.startIndex, offsetBy:j)] {
                j = pi[j-1]
            }
            
            if needle[needle.index(needle.startIndex, offsetBy: i)] == needle[needle.index(needle.startIndex, offsetBy: j)]  {
                j += 1
            }
            pi[i] = j
        }
        
        j = 0
        for i in 0..<n {
            while j>0 && haystack[haystack.index(haystack.startIndex, offsetBy: i)] != needle[needle.index(needle.startIndex, offsetBy: j)] {
                j = pi[j-1]
            }
            
            if haystack[haystack.index(haystack.startIndex, offsetBy: i)] == needle[needle.index(needle.startIndex, offsetBy: j)] {
                j += 1
            }
            
            if j == m {
                return i-m+1
            }
        }
        
        return -1
    }
}

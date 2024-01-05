//
//  SwiftNumber5.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/11/27.
//

import Foundation


@objc public class SwiftNumber5 : NSObject {
    //动态规划法
//    @objc func longestPalindrome(_ s: String) -> String {
//        let len: Int = s.count
//        if len < 2 {
//            return s
//        }
//        
//        var begin: Int = 0
//        var maxLen: Int = 1
//        let charArr:[Character] = Array(s);
//        
//        var dp: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
//    
//        for i in 0..<len {
//            dp[i][i] = true
//        }
//        
//        for L in 2...len {
//            for i in 0...len {
//                let j = L + i - 1
//                if j >= len {
//                    break
//                }
//                
//                if charArr[i] != charArr[j] {
//                    dp[i][j] = false
//                }else {
//                    if j - i < 3 {
//                        dp[i][j] = true
//                    }else {
//                        dp[i][j] = dp[i+1][j-1]
//                    }
//                }
//                
//                if dp[i][j] && j-i+1 > maxLen {
//                    maxLen = j-i+1;
//                    begin = i;
//                }
//            }
//        }
//        
//        
//        let range = s.index(s.startIndex, offsetBy: begin)..<s.index(s.startIndex, offsetBy: begin+maxLen)
//        return String(s[range])
//    }
    
    //中心扩展法
    @objc func longestPalindrome(_ s: String) -> String {
        if s.isEmpty { return "" }
        
        var start = 0, end = 0
        
        func expandAroundCenter(_ s: String, _ left: Int, _ right: Int) -> Int {
            var left = left, right = right
            while left >= 0, right < s.count, s[s.index(s.startIndex, offsetBy: left)] == s[s.index(s.startIndex, offsetBy: right)] {
                left -= 1
                right += 1
            }
            return right - left - 1
        }
        
        for i in 0..<s.count {
            let len1 = expandAroundCenter(s, i, i)
            let len2 = expandAroundCenter(s, i, i + 1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)
        return String(s[startIndex...endIndex])
    }
}

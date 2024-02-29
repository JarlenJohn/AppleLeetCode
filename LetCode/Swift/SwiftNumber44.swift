//
//  SwiftNumber44.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/2/29.
//

import Foundation

/**
 *  动态规划法
 */
class SwiftNumber44 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        let m = s.count
        let n = p.count
        
        //创建dp数组
        var dp:[[Bool]] = [[Bool]](repeatElement([Bool](repeatElement(false, count: n+1)), count: m+1));
        
        dp[0][0] = true
        
        for i in 1...n {
            if p[p.index(p.startIndex, offsetBy: i-1)] == "*" {
                dp[0][i] = true
            }else {
                break
            }
        }
        
        for i in 1...m {
            for j in 1...n {
                if p[p.index(p.startIndex, offsetBy: j-1)] == "*" {
                    dp[i][j] = dp[i][j - 1] || dp[i - 1][j]
                }else if p[p.index(p.startIndex, offsetBy: j-1)] == s[s.index(s.startIndex, offsetBy: i-1)] || p[p.index(p.startIndex, offsetBy: j-1)] == "?" {
                    dp[i][j] = dp[i - 1][j - 1];
                }
            }
        }
        
        return dp[m][n];
    }
}

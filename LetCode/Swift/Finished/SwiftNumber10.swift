//
//  SwiftNumber10.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/8.
//

import Foundation


@objc public class SwiftNumber10 : NSObject {
    @objc func isMatch(_ s: String, _ p: String) -> Bool {
        let m = s.count
        let n = p.count
        
        let matches = { (i:Int, j:Int) ->Bool  in
            if i == 0 {
                return false
            }
            
            if p[p.index(p.startIndex, offsetBy: j-1)] == "." {
                return true
            }
            
            return s[s.index(s.startIndex, offsetBy: i-1)] == p[p.index(p.startIndex, offsetBy: j-1)]
        }
        
        var f:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: m+1)
        f[0][0] = 1
        for i in 0...m {
            for j in 1...n {
                if p[p.index(p.startIndex, offsetBy: j-1)] == "*" {
                    f[i][j] |= f[i][j-2]
                    
                    if matches(i, j-1) {
                        f[i][j] |= f[i-1][j]
                    }
                }else {
                    if matches(i, j) {
                        f[i][j] |= f[i-1][j-1]
                    }
                }
            }
        }
        
        return (f[m][n] != 0)
    }
}

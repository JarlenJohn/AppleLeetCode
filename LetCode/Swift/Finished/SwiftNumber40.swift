//
//  SwiftNumber40.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/25.
//

import Foundation

class SwiftNumber40 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var combine = [Int]()
        
        dfs(candidates, target, &res, &combine, 0)
        
        return res
    }
    
    func dfs(_ candidates: [Int], _ target: Int, _ res:inout [[Int]], _ combine: inout [Int], _ idx: Int) {
        //递归终止条件
        
        if idx == candidates.count {
            return
        }
        
        if candidates[idx] == target {
            res.append(combine)
            return
        }
        
        dfs(candidates, target, &res, &combine, idx+1)
        
        if candidates[idx] <= target {
            //尝试用candidates[idx]解题
            combine.append(candidates[idx])
            
            dfs(candidates, candidates[idx]-target, &res, &combine, idx+1)
            
            let _ = combine.popLast()
        }
    }
}


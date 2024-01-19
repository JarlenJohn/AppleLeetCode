//
//  SwiftNumber39.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/19.
//

import Foundation

class SwiftNumber39 {
    
    /*
     典型的回溯+递归，太经典了，代码很美
     */
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var combine = [Int]()
        
        dfs(candidates, target, &ans, &combine, 0)
        
        return ans
    }
    
    func dfs(_ candidates: [Int], _ target: Int, _ ans: inout [[Int]], _ combine: inout [Int], _ idx: Int) {
        //定义递归的终止条件：1.到达数据末尾； 2.target为0
        if idx == candidates.count {
            return
        }
        
        if target == 0 {
            ans.append(combine)
            return
        }
        
        //直接跳过，递归下一个
        dfs(candidates, target, &ans, &combine, idx+1)
        
        if target - candidates[idx] >= 0 {
            //尝试用candidates[idx]解题
            combine.append(candidates[idx])
            
            dfs(candidates, target-candidates[idx], &ans, &combine, idx)
            
            let _ = combine.popLast()
        }
    }
}

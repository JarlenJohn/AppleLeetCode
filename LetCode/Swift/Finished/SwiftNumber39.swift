//
//  SwiftNumber39.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/19.
//

import Foundation

class SwiftNumber39 {
    var freq = [(Int, Int)]()//记录数字出现的频率，元组表示（Int，Int），第一个参数为数字，第二个参数为次数
    var ans:[[Int]] = [[Int]]()
    var sequence = [Int]()
    
    
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        let candi = candidates.sorted()
        
        //记录每个数据出现的次数
        for val in candi {
            if freq.isEmpty || val != freq.last!.0 {
                freq.append((val, 1))
            }else {
                let cnt = freq.last!.1 + 1
                let _ = freq.popLast()
                freq.append((val, cnt))
            }
        }
        
        dfs(0, target)
        
        return ans
    }
    
    func dfs(_ pos: Int, _ rest: Int) {
        
        if rest == 0 {
            ans.append(sequence)
            return
        }
        
        if pos == freq.count || rest < freq[pos].0 {
            return
        }
        
        dfs(pos+1, rest)
        
        
        let most = min(rest/freq[pos].0, freq[pos].1)
        if most == 0 {
            return
        }
        
        for i in 1...most {
            sequence.append(freq[pos].0)
            
            dfs(pos+1, rest-i*freq[pos].0)
        }
        
        for _ in 1...most {
            let _ = sequence.removeLast()
        }
    }
}

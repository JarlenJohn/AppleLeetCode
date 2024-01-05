//
//  SwiftNumber15.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/19.
//

import Foundation

@objc class SwiftNumber15 : NSObject {
    /*
     排序后使用双指针思路解决
     双指针适用场景：当遍历过程中一个变量的增加会导致另一个变量减小
     */
    @objc func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        
        let cnt = nums.count
        var results: [[Int]] = [[Int]]()
        
        for i in 0..<cnt {
            // 需要和上一次枚举的数不相同
            if i>0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }
            
            var k = cnt-1;
            let target = -sortedNums[i]
            
            for j in i+1..<cnt {
                // 需要和上一次枚举的数不相同
                if j > i+1 && sortedNums[j] == sortedNums[j-1] {
                    continue
                }
                
                // 需要保证 b 的指针在 c 的指针的左侧
                while j<k && sortedNums[j]+sortedNums[k] > target {
                    k -= 1
                }
                
                if j == k {
                    break
                }
                
                if sortedNums[j]+sortedNums[k] == target {
                    results.append([sortedNums[i], sortedNums[j], sortedNums[k]])
                }
            }
        }
        
        return results
    }
}

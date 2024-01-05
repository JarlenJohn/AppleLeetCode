//
//  SwiftNumber18.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/21.
//

import Foundation

@objc class SwiftNumber18 : NSObject {
    //个人认为跟三数之和和三数之和最接近target思路应该完全相同吧，但是时间复杂度？
    @objc func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [[]] }
        
        let nums = nums.sorted()
        
        let cnt = nums.count
        var results = [[Int]]()
        
        for i in 0..<cnt-3 {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            
            if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target {
                break;
            }
            
            if nums[i] + nums[cnt - 3] + nums[cnt - 2] + nums[cnt - 1] < target {
                continue;
            }
            
            for j in i+1..<cnt-2 {
                if j > i+1 && nums[j] == nums[j-1] {
                    continue
                }
                
                var k=j+1, l = cnt-1
                while k < l && k<cnt {
                    let sum = nums[i] + nums[j] + nums[k] + nums[l]
                    
                    if sum == target {
                        results.append([nums[i], nums[j], nums[k], nums[l]])
                        
                        while k < l && nums[k] == nums[k+1] {
                            k += 1
                        }
                        k+=1;
                        
                        while k < l && nums[l] == nums[l-1]{
                            l -= 1
                        }
                        l -= 1
                    }else if sum < target {
                        k += 1
                    }else {
                        l -= 1
                    }
                }
            }
        }
        
        return results
    }
}

//
//  SwfitNumber41.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/2/23.
//

import Foundation

    /*
     给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。
     请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。
     
     /*
      实际上，对于一个长度为 N 的数组，其中没有出现的最小正整数只能在 [1,N+1] 中
      */
     */
@objc class SwiftNumber41 : NSObject {
    
    @objc func test() {
        let nums = [0, 1, 2, 3, 4, 5, 6]
        
        let res = firstMissingPositive(nums)
        print(res)
    }
    
    
    func firstMissingPositive(_ nums: [Int]) -> Int {
        
        var nums = nums
        let cnt = nums.count
        
        //1.将数组中小于等于0的数转成N+1
        for (i, num) in nums.enumerated() {
            if  num <= 0 {
                nums[i] = cnt + 1
            }
        }
        
        //2.将<=cnt的元素对应位置变为负数
        for num in nums where num <= cnt {
            nums[num-1] = -abs(nums[num-1])
        }
        
        //3.返回第一个大于零的元素下标+1
        for i in 0..<cnt {
            if nums[i] > 0 {
                return i+1
            }
        }
        
        return cnt+1
    }
}

//
//  SwiftNumber34.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/11.
//

import Foundation
/*
 给你一个按照非递减顺序排列的整数数组 nums，和一个目标值 target。请你找出给定目标值在数组中的开始位置和结束位置。

 如果数组中不存在目标值 target，返回 [-1, -1]。

 你必须设计并实现时间复杂度为 O(log n) 的算法解决此问题。

 */

class SwiftNumber34 {
    //时间复杂度为 O(log n)，用二分法
    
    /*
     1.开始位置即为target第一次出现的位置，二分查找即可
     2.结束位置为第一个大于target的位置-1
     3.校验索引是否满足条件及越界检查等
     */
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        //开始位置
        let left = binarySearch(nums, true, target)
        
        //结束位置
        let right = binarySearch(nums, false, target)-1
        
        //校验
        if left <= right && right<nums.count && (nums[left] == nums[right]) {
            return [left, right]
        }
        
        return [-1, -1]
    }
    
    //二分查找target在nums中的索引，lower为true表示查找第一个大于等于target的索引
    func binarySearch(_ nums: [Int], _ lower: Bool, _ target: Int) -> Int {
        var left = 0, right = nums.count - 1, ans = nums.count
        
        while left <= right {
            let mid = (left + right) >> 1
            
            if target < nums[mid] || (lower && target <= nums[mid]) {
                right = mid - 1
                ans = mid
            }else {
                left = mid + 1
            }
        }
        return ans
    }
}

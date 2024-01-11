//
//  SwiftNuber35.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/11.
//

import Foundation

/*
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 请必须使用时间复杂度为 O(log n) 的算法。
 */
class SwiftNuber35 {
    /*
     最后的目标：「在一个有序数组中找第一个大于等于 target的下标」
     */
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        let cnt = nums.count
        var leftIdx = 0, rightIdx = cnt-1
        
        //为啥是cnt，因为可以少处理边界情况，比如target比所有元素都大时，结果就是cnt
        var ans = cnt
        
        while leftIdx <= rightIdx {
            let mid = (leftIdx + rightIdx) >> 1
            
            if target <= nums[mid] {
                rightIdx = mid - 1
                ans = mid
            }else {
                leftIdx = mid + 1
            }
        }
        
        return ans + 1
    }
}

//
//  SwiftNumber31.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/8.
//

import Foundation

/*
 整数数组的一个 排列  就是将其所有成员以序列或线性顺序排列。
 给你一个整数数组 nums ，找出 nums 的下一个排列。
 必须 原地 修改，只允许使用额外常数空间。
 */
@objc class SwiftNumber31 : NSObject {
    @objc func test() {
        var nums = [3, 2, 1]
//        nextPermutation(&nums)
//        
//        for val in nums {
//            print(val)
//        }
//        
//        print("------------------")
//        nums = [1, 2]
//        nextPermutation(&nums)
//        for val in nums {
//            print(val)
//        }
        
        print("------------------")
        nums = [3, 2, 1]
        nextPermutation(&nums)
        for val in nums {
            print(val)
        }
    }
    
    
    /*
     下一排列必然大于当前排列，如[1, 2, 3]的下一排列[1, 3, 2]
     直观的发现是交换了两个数，我们称被交换的数为最小数和最大数，那如何求解最小数最大数呢？
     通过观察我们发现，对于长度为n的排列a：
     
     1.首先从后向前找出第一个顺序对(i, i+1),使得nums[i]<nums[i+1],这个i位置就是最小数
     2.同理，我们从后向前找出j，使得nums[j] > nums[i], j位置就是最大数，交换i和j位置的元素
     3.在此过程中，我们还需要保证变大的幅度尽可能小，i+1位置开始升序排列可保证变大的幅度小，注意到i+1位置开始后续都是倒序排列，因此直接用双指针交换即可，不用排序
     */
    func nextPermutation(_ nums: inout [Int]) {
        let cnt = nums.count
        
        //从右向左找出i，使得nums[i] < nums[i+1]
        var i = cnt - 2
        while i>=0 && nums[i] >= nums[i+1] {
            i -= 1
        }
        
        if i >= 0 {//i 存在，则从右向左找出j，使得nums[j] > nums[i]
            var j = cnt-1
            while j >= 0 && nums[j] <= nums[i] {
                j -= 1
            }
            
            //交换i和j
            nums.swapAt(i, j)
        }
        
        //i+1位置开始，升序排列，以保证变大的幅度尽可能小。由于题目要求必须 原地 修改，只允许使用额外常数空间。因此使用双指针操作
        i = i + 1
        var j = cnt-1
        while i < j {
            nums.swapAt(i, j)
            
            i += 1
            j -= 1
        }
    }
}

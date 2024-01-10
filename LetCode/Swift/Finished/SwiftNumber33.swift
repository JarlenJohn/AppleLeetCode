//
//  SwiftNumber33.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/10.
//

import Foundation

@objc class SwiftNumber33 : NSObject {
    
    @objc func test() {
        let nums = [5, 1, 3]
        let res = search(nums, 3)
        print(res)
    }
    
    //时间要求为O(logn)，因此，首先想到的是用二分查找
    //但是，数组在某个未知位置被旋转了，那么需要找到规律：
    /*
     定理一：只有在顺序区间内才可以通过区间两端的数值判断target是否在其中。
     定理二：判断顺序区间还是乱序区间，只需要对比 left 和 right 是否是顺序对即可，left <= right，顺序区间，否则乱序区间。
     定理三：每次二分都会至少存在一个顺序区间
     */
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        let cnt = nums.count
        var left = 0, right = cnt - 1
        
        while left <= right {
            let mid = (left + right) >> 1
            
            if target == nums[mid] {
                return mid
            }
            
            if nums[left] <= nums[mid] {//左侧严格升序
                if target >= nums[left] && target < nums[mid] {//值是否在有序区间内
                    right = mid - 1
                }else {
                    left = mid + 1
                }
            }else {//右侧严格升序
                if target > nums[mid] && target <= nums[right] {//值是否在有序区间内
                    left = mid + 1
                }else {
                    right = mid - 1
                }
            }
        }
        
        return -1
    }
}

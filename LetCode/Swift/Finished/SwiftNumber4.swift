//
//  LetCode.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/11/21.
//

import Foundation


@objc class SwiftNuber4 : NSObject {
    
    @objc func test(num1: [Int], num2: [Int]) -> AnyObject {
        let d = findMedianSortedArrays(num1, num2)
        return NSNumber(value: d) as AnyObject
    }
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let totalLen = nums1.count + nums2.count;
        
        if totalLen % 2 == 0 {
            let sum = getKthElement(num1: nums1, num2: nums2, kth: (totalLen+1)/2) + getKthElement(num1: nums1, num2: nums2, kth: (totalLen+2)/2)
            return Double(sum) / 2.0
        }else {
            let res = getKthElement(num1: nums1, num2: nums2, kth: (totalLen+1)/2)
            return Double(res)
        }
    }
    
    
    /* 主要思路：要找到第 k (k>1) 小的元素，那么就取 pivot1 = nums1[k/2-1] 和 pivot2 = nums2[k/2-1] 进行比较
     * nums1 中小于等于 pivot1 的元素有 nums1[0 .. k/2-2] 共计 k/2-1 个
     * nums2 中小于等于 pivot2 的元素有 nums2[0 .. k/2-2] 共计 k/2-1 个
     * 取 pivot = min(pivot1, pivot2)，两个数组中小于等于 pivot 的元素共计不会超过 (k/2-1) + (k/2-1) <= k-2 个
     * 这样 pivot 本身最大也只能是第 k-1 小的元素
     * 如果 pivot = pivot1，那么 nums1[0 .. k/2-1] 都不可能是第 k 小的元素。把这些元素全部 "删除"，剩下的作为新的 nums1 数组
     * 如果 pivot = pivot2，那么 nums2[0 .. k/2-1] 都不可能是第 k 小的元素。把这些元素全部 "删除"，剩下的作为新的 nums2 数组
     * 由于我们 "删除" 了一些元素（这些元素都比第 k 小的元素要小），因此需要修改 k 的值，减去删除的数的个数
     */
    func getKthElement(num1: [Int], num2:[Int], kth: Int) -> Int {
        let m: Int = num1.count
        let n: Int = num2.count
        var k = kth
        
        var index1: Int = 0, index2: Int = 0
        
        while true {
            
            //处理边界情况
            if index1 == m {
                return num2[index2 + k - 1]
            }
            
            if index2 == n {
                return num1[index1 + k - 1]
            }
            
            if k == 1 {
                return min(num1[index1], num2[index2])
            }
            
            //处理正常情况
            let newIdx1: Int = min(index1 + k/2 - 1, m-1)
            let newIdx2: Int = min(index2 + k/2 - 1, n-1)
            
            let pivot1 = num1[newIdx1]
            let pivot2 = num2[newIdx2]
            
            if pivot1 <= pivot2 {
                k -= newIdx1 - index1 + 1
                index1 = newIdx1 + 1
            }else {
                k -= newIdx2 - index2 + 1
                index2 = newIdx2 + 1
            }
        }
    }
}



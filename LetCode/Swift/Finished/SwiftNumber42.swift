//
//  SwiftNumber42.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/2/24.
//

import Foundation

class SwiftNumber42 {
    /*
     对于下标i，下雨后水能到达的最大高度等于下标i两边的最大高度的最小值，下标i处能接的雨水量等于下标i处的水能到达的最大高度减去height[i]。
     记左边最大高度为：leftMax， 右边最大高度为：rightMax
     则位置i处可储水容量：min(leftMax, rightMax) - height[i]
     */
    
    //双指针法
    func trap(_ height: [Int]) -> Int {
        
        let cnt = height.count
        
        var ans = 0
        var left = 0, right = cnt-1
        
        var leftMax = 0
        var rightMax = 0
        
        while left < right {
            leftMax = max(leftMax, height[left])
            rightMax = max(rightMax, height[right])
            
            if height[left] < height[right] {//height[left] < height[right]，必然有leftMax<rightMax, 因此只使用leftMax
                ans += leftMax - height[left]
                left += 1
            }else {
                ans += rightMax - height[right]
                right -= 1
            }
        }
        
        return ans
    }
}

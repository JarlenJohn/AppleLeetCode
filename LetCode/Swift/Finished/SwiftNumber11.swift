//
//  SwiftNumber11.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/13.
//

import Foundation

@objc public class SwiftNumber11 : NSObject {
    func maxArea(_ height: [Int]) -> Int {
        if height.count <= 0 {
            return 0
        }
        
        if height.count == 1 {
            return height[0];
        }
        
        let count: Int = height.count
        
        var maxArea:Int = 0
        var i:Int = 0
        var j:Int = count-1
        while(i < j) {
            maxArea = max(maxArea, min(height[j],height[i])*(j-i))
            
            if height[i] > height[j] {
                j-=1
            }else {
                i+=1
            }
        }
        return maxArea
    }
}



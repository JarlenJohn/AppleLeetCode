//
//  SwfitNumber29.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/4.
//

import Foundation

class SwiftNumber29 {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        //处理边界情况
        if dividend == 0 {
            return 0
        }
        
        if divisor == 1 {
            return dividend
        }
        
        if divisor == -1 {
            if dividend > Int32.min {
                return -dividend
            }
            return Int(Int32.max)
        }
        
        let flag = (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0)
        let a = dividend > 0 ? dividend : -dividend
        let b = divisor > 0 ? divisor : -divisor
        
        let res = div(a, b)
        return flag == true ? res : -res
    }
    
    func div(_ a:Int, _ b:Int) -> Int {
        if a < b {
            return 0
        }
        
        var count = 1
        var result = 0
        while result + result < a {
            count += 1
            result += result
        }
        
        return count + div(a-result, b)
    }
}

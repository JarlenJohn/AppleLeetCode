//
//  SwiftNumber9.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/5.
//

import Foundation

@objc public class SwiftNumber9 : NSObject {
    @objc func isPalindrome(_ x: Int) -> Bool {
        
        //处理边界情况
        //负数or最后一位是0
        if x < 0 || (x != 0 && x % 10 == 0) {
            return false
        }
        
        //如果是回文数，反转后的部分和未翻转的应该相等，因此翻转数字的一半，节省时间及空间
        var reverSuffix:Int = 0
        //翻转
        var x = x
        while (x > reverSuffix){
            reverSuffix = reverSuffix * 10 + x%10;
            x /= 10
        }
        
        //当数字为奇数个时，通过reverSuffix/10去除末尾
        if x == reverSuffix || x == reverSuffix/10 {
            return true
        }
        
        return false
    }
}

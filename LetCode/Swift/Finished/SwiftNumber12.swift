//
//  SwiftNumber12.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/15.
//

import Foundation

@objc class SwiftNumber12 : NSObject {
//    @objc func intToRoman(_ num: Int) -> String {
//        
//        //模拟遍历法
//        //先将各种值列举出来，从大到小排好序
//        let valueSymbols: [[Int:String]] = [
//            [1000:"M"],
//            [900:"CM"], [500:"D"], [400:"CD"], [100:"C"],
//            [90:"XC"], [50:"L"],[40:"XL"],[10:"X"],
//            [9:"IX"],[5:"V"], [4:"IV"], [1:"I"]
//        ]
//        
//        var x = num;
//        var result = ""
//        //拿到数值从大到小取，并减去罗马字母对应的值，继续比较
//        for item:[Int:String] in valueSymbols {
//            let value = item.keys.first!
//            let symbol = item.values.first!
//            
//            while x >= value {
//                result += symbol;
//                x = x - value
//            }
//            
//            if x == 0 {
//                break
//            }
//        }
//        
//        return result
//    }
    
    //方法二 硬编码数字
    @objc 
    func intToRoman(_ num: Int) -> String {
        let thounds = ["", "M", "MM", "MMM"]
        let hundrand = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        let tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC" ]
        let ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        
        return thounds[num/1000] + hundrand[num % 1000 / 100] + tens[num%100/10] + ones[num%10]
    }
}

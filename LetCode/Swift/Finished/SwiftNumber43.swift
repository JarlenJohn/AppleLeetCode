//
//  SwiftNumber43.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/2/28.
//

import Foundation

@objc class SwiftNumber43 : NSObject {
    
    @objc func test() {
        let res = multiply("2", "3")
        print(res)
    }
    
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        var ans = "0"
        let m = num1.count
        let n = num2.count
        
        for i in (0..<n).reversed() {
            var add = 0//进位
            var curr = [Int]()
            
            //补0
            for j in (0..<n).reversed() {
                if j > i {
                    curr.append(0)
                }
            }
            
            let char = num2[num2.index(num2.startIndex, offsetBy: i)]
            let y = Int(String(char))!//乘数的一位
            
            for j in (0..<m).reversed() {
                let char = num1[num1.index(num1.startIndex, offsetBy: j)]
                let x = Int(String(char))!//被乘数的一位
                
                let result = x * y + add;
                curr.append(result % 10)
                add = result / 10
            }
            
            while add != 0 {
                curr.append(add % 10)
                add /= 10
            }
            
            //将两字符串相加
            let result:String = curr.reversed().map { String($0) }.joined()
            ans = addStrings(ans, result)
        }
        
        return ans
    }
    
    func addStrings(_ str1: String, _ str2: String) -> String {
        var i = str1.count - 1, j = str2.count - 1, add = 0
        
        var cur = [Int]()
        while i >= 0 || j >= 0 || add != 0 {
            
            let x = i>=0 ? Int(String(str1[str1.index(str1.startIndex, offsetBy: i)]))! : 0
            let y = j>=0 ? Int(String(str2[str2.index(str2.startIndex, offsetBy: j)]))! : 0
            
            let result = x + y + add
            
            cur.append(result % 10)
            add = result / 10
            
            i -= 1
            j -= 1
        }
        
        let result = cur.reversed().map { String($0) }.joined()
        return result
    }
}

//
//  SwiftNumber13.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/18.
//

import Foundation

@objc class SwiftNumber13 : NSObject {
    @objc func romanToInt(_ s: String) -> Int {
        let symbols:[Character: Int] = [
            "I":1,
            "V":5,
            "X":10,
            "L":50,
            "C":100,
            "D":500,
            "M":1000
        ]
        
        var result: Int = 0;
        let n = s.count
        for i in 0..<n {
            let symbol:Character = s[s.index(s.startIndex, offsetBy: i)]
            let value:Int = symbols[symbol]!
            if i<n-1 && value < symbols[s[s.index(s.startIndex, offsetBy: i+1)]]! {
                result -= value
            }else {
                result += value
            }
        }
        
        return result
    }
}

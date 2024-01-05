//
//  SwiftNumber7.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/11/29.
//

import Foundation

@objc public class SwiftNumber7 : NSObject {
    @objc func reverse(_ x: Int) -> Int {
        var x = x;
        var n: Int = 0
        
        while x != 0 {
            n = n * 10 + x % 10
            x /= 10
        }
        
        if n < Int32.min || n > Int32.max {
            return 0
        }else {
            return n
        }
    }
}

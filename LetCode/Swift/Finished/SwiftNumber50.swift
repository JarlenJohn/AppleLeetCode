//
//  SwiftNumber50.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/4.
//

import Foundation

@objc class SwiftNumber50 : NSObject {
    
    @objc func myPow(_ x: Double, _ n: Int) -> Double {
        let N = n
        let res = N > 0 ? quiMul(x, N) : 1/quiMul(x, -N)
        return res
    }
    
    //递归法清晰，但是占用了栈空间，因此，我们使用迭代实现
    func quiMul(_ x:Double, _ n:Int) -> Double {
        
        var N = n
        var ans:Double = 1.0;
        
        var contribute = x
        while N > 0 {
            if N % 2 == 1 {
                ans *= contribute
            }
            
            //将贡献不断地平方
            contribute *= contribute
            
            N /= 2
        }
        
        return ans
    }
    
    //    //确保n>0,计算n次方
//        func quiMul(_ x:Double, _ n:Int) -> Double {
//            if n == 0 {
//                return 1
//            }
//    
//            let y = quiMul(x, n/2)//对半劈开,x^4 = x^2 * x^2
//            return n % 2 == 0 ? y * y : y*y*x
//        }
}


//
//  SwiftNumber6.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/11/28.
//

import Foundation

@objc public class SwiftNumber6 : NSObject {
//    //方法一 利用二维矩阵模拟
//    @objc func convert(_ s: String, _ numRows: Int) -> String {
//        //处理边界情况，若1 row or 1 column
//        let n: Int = s.count
//        if numRows == 1 || n <= numRows {
//            return s
//        }
//        
//        let t: Int = 2*numRows-2 //一个周期字符数
//        let cpt: Int = numRows - 1 //一个周期所占列数
//        let c: Int = (n+t-1)/t * cpt //总列数，注意最后一列填充满
//        
//        //构造 numrow行c列矩阵
//        var datas: [[String]] = [[String]](repeating: [String](repeating: "", count: c), count: numRows);
//        
//        var x: Int = 0
//        var y: Int = 0
//        //遍历
//        for i in 0..<n {
//            let s: String = String(s[s.index(s.startIndex, offsetBy: i)])
//            
//            datas[x][y] = s
//            
//            if i % t < numRows - 1 {//向下遍历
//                x += 1
//            }else {//向斜上遍历
//                x -= 1
//                y += 1
//            }
//        }
//        
//        var result: String = ""
//        for i in 0..<numRows {
//            for j in 0..<c {
//                let temps = datas[i][j]
//                if temps.count > 0 {
//                    result = result.appending(temps)
//                }
//            }
//        }
//        
//        return result
//    }
//    
//    
//    //方法二 压缩矩阵
//    @objc func convert(_ s: String, _ numRows: Int) -> String {
//        //处理边界情况，若1 row or 1 column
//        let n: Int = s.count
//        if numRows == 1 || n <= numRows {
//            return s
//        }
//        
//        let t: Int = 2*numRows-2 //一个周期字符数
//        
//        //构造字符串数组
//        var datas:[String] = [String](repeating: "", count: numRows);
//        
//        var x: Int = 0
//        //遍历并填充值
//        for i in 0..<n {
//            let s: String = String(s[s.index(s.startIndex, offsetBy: i)])
//            
//            datas[x] = datas[x].appending(s)
//            
//            if i % t < numRows - 1 {//向下遍历
//                x += 1
//            }else {//向斜上遍历
//                x -= 1
//            }
//        }
//        
//        var result: String = ""
//        for i in 0..<numRows {
//            result = result.appending(datas[i])
//        }
//        return result
//    }
//    
//    //方法三 直接构造法
//    @objc func convert(_ s: String, _ numRows: Int) -> String {
//        //处理边界情况，若1 row or 1 column
//        let n: Int = s.count
//        if numRows == 1 || n <= numRows {
//            return s
//        }
//        
//        let t: Int = 2*numRows-2 //一个周期字符数
//    
//        var ans: String = ""
//        
//        for i in 0..<numRows {
//            var j = 0
//            while j + i < n {
//                ans = ans.appending(String(s[s.index(s.startIndex, offsetBy: j+i)]))//第一个字符
//                
//                if i > 0 && i < numRows - 1 && j + t - i < n {
//                    ans = ans.appending(String(s[s.index(s.startIndex, offsetBy: j+t-i)]))// 当前周期的第二个字符
//                }
//                
//                j += t
//            }
//        }
//        
//        return ans
//    }
    
    /***********************************************God like***********************************************/
    //方法四 *****推荐 K神flag解法
    @objc func convert(_ s: String, _ numRows: Int) -> String {
        if numRows < 2 {
            return s
        }
        
        var rows = Array(repeating: "", count: numRows)
        var i = 0, flag = -1
        
        for c in s {
            rows[i].append(c)
            if i == 0 || i == numRows - 1 {
                flag = -flag
            }
            i += flag
        }
        
        var res = ""
        for row in rows {
            res += row
        }
        return res
    }
    
}

//
//  SwfitNumber30.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/5.
//

import Foundation

@objc class SwiftNumber30 : NSObject {
    @objc func test() {
        let s = "barfoothefoobarman"
        
        let words =  ["foo","bar"]
        
        let start = CFAbsoluteTimeGetCurrent()
        let res = findSubstring(s, words)
        let end = CFAbsoluteTimeGetCurrent()
        print("elapsed time = %f", end - start)
        
        for idx in res {
            print(idx)
        }
    }
    
    //滑动窗口法 + 哈希表
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        
        var res:[Int] = [Int]()
        let m = words.count, n = words[0].count, ls = s.count
        
        // 开始对s切片，由于模式字符串长度为n，则n为一个周期切片就不会重复出现，且考虑到了所有不同的切片模式
        for i in 0..<n {
            //滑动窗口超过了总长度，则终止
            if i + m * n > ls {
                break
            }
            
            //用一个哈希表 differ表示窗口中单词频次和words中单词频次之差
            var differ:[String: Int] = [String : Int]()
            
            //滑动窗口所含单词数量为m个，个数加1
            for j in 0..<m {
                let str:String = String(s[s.index(s.startIndex, offsetBy: i+j*n)..<s.index(s.startIndex, offsetBy: i+(j+1)*n)])
                
                differ[str] = (differ[str] ?? 0)+1;
            }
            
            //words中存在的单词个数减1
            for word in words {
                differ[word] = (differ[word] ?? 0)-1;
                if differ[word] == 0 {
                    differ.removeValue(forKey: word)
                }
            }
            
            //以n为步进值，滑动窗口开始判断
            var start = i
            while start < (ls - m * n + 1 ) {
                if start != i {
                    //右侧增加的一个字符串计数值加1
                    var str:String = String(s[s.index(s.startIndex, offsetBy: start+(m-1)*n)..<s.index(s.startIndex, offsetBy: start+m*n)])
                    differ[str] = (differ[str] ?? 0) + 1;
                    if differ[str] == 0 {
                        differ.removeValue(forKey: str)
                    }
                    
                    //左侧移出去的字符串计数值减1
                    str = String(s[s.index(s.startIndex, offsetBy: start-n)..<s.index(s.startIndex, offsetBy: start)])
                    differ[str] = (differ[str] ?? 0) - 1;
                    if differ[str] == 0 {
                        differ.removeValue(forKey: str)
                    }
                }
                
                //窗口中单词频次和words中单词频次之差为0表示配对到了
                if differ.isEmpty {
                    res.append(start)
                }
                
                start += n
            }
            
        }
        
        
        return res
    }
    
    //    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    //        guard words.count > 0 else {
    //            return []
    //        }
    //        let sLen = s.count, wordCount = words.count, wordSize = words[0].count
    //        var ans: [Int] = []
    //
    //        var wordsMp: [String: Int] = [:]
    //        for word in words {
    //            wordsMp[word, default: 0] += 1
    //        }
    //
    //        let sArr = Array(s)
    //
    //        // 分组，单词必须连续，所以分组是可以复用的，
    //        for i in 0..<wordSize {
    //            var cnt: [String: Int] = [:]
    //            var start = i
    //            for j in stride(from: i, to: sLen, by: wordSize) {
    //                let word = String(sArr[j..<min(j+wordSize, sLen)])
    //                if wordsMp[word] == nil {
    //                    cnt.removeAll()
    //                    start = j + wordSize
    //                } else {
    //                    cnt[word, default: 0] += 1
    //                    while cnt[word, default: 0] > wordsMp[word, default: 0] {
    //                        cnt[String(sArr[start..<min(start+wordSize, sLen)]), default: 0] -= 1
    //                        start += wordSize
    //                    }
    //                    if j-start == (wordCount-1) * wordSize {
    //                        ans.append(start)
    //                    }
    //                }
    //            }
    //        }
    //        return ans
    //    }
}

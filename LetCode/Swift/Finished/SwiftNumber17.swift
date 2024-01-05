//
//  SwiftNumber17.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/21.
//

import Foundation

@objc class SwiftNumber17 : NSObject {
    //深度优先遍历
    @objc func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        
        let phoneMap:[Character : String] = [
            "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
            "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"
        ]
        
        var combinations:[String] = [String]();
        var combination:String = ""
        
        //回朔法,
        func backTrack(_ index:Int) {
            if index == digits.count {
                combinations.append(combination)
            }else {
                let digit = digits[digits.index(digits.startIndex, offsetBy: index)]
                if let letters = phoneMap[digit] {
                    for letter in letters {
                        combination.append(letter)
                        backTrack(index+1)
                        combination.removeLast()
                    }
                }
            }
        }
        
        backTrack(0)
        
        return combinations
    }
}

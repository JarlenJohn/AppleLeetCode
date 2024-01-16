//
//  SwiftNumber36.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/12.
//

import Foundation

class SwiftNumber36 {
    //判断有效的数独
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        /*
         有效数独的三个条件：
         1.同一个数字在每一行只能出现一次；
         2.同一个数字在每一列只能出现一次；
         3.同一个数字在每一个小九宫格只能出现一次。
         
         去重类问题，我们想到了哈希表的使用，如何结合起来呢？
         我们首先考虑行数据，每行有个哈希表，记录了该行中数字出现的频率，数据可组织为：rows = [[key:val]],
         由于数独中的数字范围是1到9，因此可以使用数组代替哈希表进行计数,数据可组织为：rows = [[Int]]，减少复杂度。
         同理，列数据可得
         
         那么小九宫有何规律呢？
         仔细观察发现，9x9 分块后变成了3x3，那么小九宫格的索引自然就是 i/3, j/3，此处记录数据的数组容量仍然为9
         数据用三维数组形式表示为：subboxes = [[[Int]]]
         */
        var rows:[[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        var columns = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        var subboxes = Array(repeating: Array(repeating: Array(repeating: 0, count: 9), count: 3), count: 3)
        
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j]
                
                if c != "." {
                    let index:Int = c.wholeNumberValue! - 1
                    
                    rows[i][index] += 1
                    columns[j][index] += 1
                    subboxes[i/3][j/3][index] += 1;
                    
                    if rows[i][index] > 1 || columns[j][index] > 1 || subboxes[i/3][j/3][index] > 1 {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}

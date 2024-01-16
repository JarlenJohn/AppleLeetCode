//
//  SwfitNumber37.swift
//  LetCode
//
//  Created by JarlenJohn on 2024/1/16.
//

import Foundation

class SwfitNumber37 {
    func solveSudoku(_ board: inout [[Character]]) {
        var row:[[Bool]] = Array(repeating: Array(repeating: false, count: 9), count: 9)
        var column:[[Bool]] = Array(repeating: Array(repeating: false, count: 9), count: 9)
        var block:[[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: 9), count: 3), count: 3)
        
        var spaces:[(Int, Int)] = [(Int, Int)]()
        
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j];
                
                if c == "." {
                    //位置空的记录下来，后续填充数字
                    spaces.append((i, j))
                }else {
                    //有值的标记好，方便判断是否是有效数独
                    let num:Int = c.wholeNumberValue!
                    row[i][num-1] = true
                    column[j][num-1] = true
                    block[i/3][j/3][num-1] = true
                }
            }
        }
        
        var valid:Bool = false
        func dfs(_ board: inout [[Character]], _ pos: Int) {
            
            if pos == spaces.count {//遍历结束了，无冲突，说明有解了
                valid = true
                return;
            }
            
            let (i, j) = spaces[pos]
            for x in 1...9 {
                if !valid && !row[i][x-1] && !column[j][x-1] && !block[i/3][j/3][x-1] {
                    
                    //将当前值尝试填入【i，j】位置，后续不成立
                    board[i][j] = String(x).first!
                    
                    //更新标记位
                    row[i][x-1] = true
                    column[j][x-1] = true
                    block[i/3][j/3][x-1] = true
                    
                    //递归检查下一个空位置是否有解
                    dfs(&board, pos+1)
                    
                    //在无解情况下，回溯到当前递归层时，我们还要将上述的三个值重新置为 False
                    row[i][x-1] = false
                    column[j][x-1] = false
                    block[i/3][j/3][x-1] = false
                }
            }
        }
        
        dfs(&board, 0)
    }
}

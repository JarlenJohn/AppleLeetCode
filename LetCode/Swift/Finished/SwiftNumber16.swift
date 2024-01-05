//
//  SwiftNumber16.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/20.
//

import Foundation

@objc class SwiftNumber16 : NSObject {
    @objc func test() {
        let arr = [-13,592,-501,770,-952,-675,322,-829,-246,657,608,485,-112,967,-30,182,-969,559,-286,-64,24,365,-158,701,535,-429,-217,28,948,-114,-536,-711,693,23,-958,-283,-700,-672,311,314,-712,-594,-351,658,747,949,70,888,166,495,244,-380,-654,454,-281,-811,-168,-839,-106,877,-216,523,-234,-8,289,-175,920,-237,-791,-976,-509,-4,-3,298,-190,194,-328,265,150,210,285,-176,-646,-465,-97,-107,668,892,612,-54,-272,-910,557,-212,-930,-198,38,-365,-729,-410,932,4,-565,-329,-456,224,443,-529,-428,-294,191,229,112,-867,-163,-979,236,-227,-388,-209,984,188,-549,970,951,-119,-146,801,-554,564,-769,334,-819,-356,-724,-219,527,-405,-27,-759,722,-774,758,394,146,517,870,-208,742,-782,336,-364,-558,-417,663,-914,536,293,-818,847,-322,408,876,-823,827,167]
        let result = threeSumClosest(arr, 7175)
        print(result)
    }
    @objc func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNum = nums.sorted()
        let cnt = sortedNum.count
        
        var result: Int = Int(1e7)
        
        let updateValue = {(sum:Int) in
            if sum == 2938 {
                print("")
            }
            
            if abs(sum-target) < abs(result-target) {
                result = sum;
            }
        }
        
        for i in 0..<cnt {
            if i>0 && sortedNum[i] == sortedNum[i-1] {
                continue
            }
            
            //由于有序，后面无论怎么选，选出的三个数的和不会比 s 还小
            if i<cnt-2 && sortedNum[i]+sortedNum[i+1]+sortedNum[i+2]>=target {
                updateValue(sortedNum[i]+sortedNum[i+1]+sortedNum[i+2]);
                break
            }
            
            //由于数组已经排序，nums[i] 加上后面任意两个数都不超过 s，所以下面的双指针就不需要跑了，但i增大后存在可能，因此继续外层
            if cnt > 1 && i<cnt-2 && sortedNum[i] + sortedNum[cnt-2] + sortedNum[cnt-1] < target {
                updateValue(sortedNum[i]+sortedNum[cnt-2]+sortedNum[cnt-1]);
                continue
            }
            
            var j=i+1, k=cnt-1
            while j < k {
                let s = sortedNum[i] + sortedNum[j] + sortedNum[k]
                if s == target {
                    return target
                }
                
                updateValue(s);
                
                if s < target {
                    var j0 = j+1;
                    while j0<cnt && sortedNum[j0] == sortedNum[j0-1] {
                        j0 += 1
                    }
                    j = j0
                }else {
                    var k0 = k-1
                    while k0 > 0 && sortedNum[k0] == sortedNum[k0+1] {
                        k0 -= 1
                    }
                    k = k0
                }
            }
        }
        
        return result
    }
}

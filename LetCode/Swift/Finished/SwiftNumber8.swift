//
//  SwiftNumber8.swift
//  LetCode
//
//  Created by JarlenJohn on 2023/12/1.
//

import Foundation


@objc public class SwiftNumber8 : NSObject {
    @objc func myAtoi(_ s: String) -> Int {
        let auto = AutomationSwift()
        for chara in s {
            auto.getChar(chara: chara)
        }
        
        return Int(auto.flag) * auto.num
    }
    
    
    
    enum StateEnum : Int {
        case start;
        case signed;
        case inNumber;
        case end;
    }

    class AutomationSwift: NSObject {
        public var flag: Int32 = 1
        public var num: Int = 0
        
        var state: StateEnum = .start
        
        let transitionTable:[StateEnum : Array<StateEnum>]
        
        override init() {
            self.transitionTable = [
                .start:     [.start, .signed, .inNumber, .end],
                .signed :   [.end, .end, .inNumber, .end],
                .inNumber:  [.end,.end, .inNumber, .end],
                .end:       [.end, .end, .end, .end,],
            ];
        }
        
        public func getChar(chara: Character) -> Void {
            let idx: Int = getCharIdx(chara: chara).rawValue
            let newState = self.transitionTable[state]![idx]
            
            self.state = newState
            
            if state == .inNumber {
                num = num * 10 + Int(chara.asciiValue! - Character("0").asciiValue!)
                num = flag == 1 ? min(num, Int(INT32_MAX)) : min(num, -Int(Int32.min))
            }else if state == .signed {
                flag = chara == "+" ? 1 : -1
            }
        }
        
        func getCharIdx(chara: Character) -> StateEnum {
            if chara == " " {
                return .start
            }
            
            if chara == "+" || chara == "-" {
                return .signed
            }
            
            if chara >= "0" && chara <= "9" {
                return .inNumber
            }
            
            return .end
        }
    }

}


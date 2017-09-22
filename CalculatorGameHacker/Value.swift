//
//  Value.swift
//  CalculatorGameHacker
//
//  Created by Scott on 2017/9/21.
//  Copyright © 2017年 ScottLi. All rights reserved.
//

import Foundation

protocol Value {
    var rawInt: Int?  { get }
    var rawUInt: UInt? { get }
    var rawFloat: Float?  { get }
    
    func operate(with operater: Operator) -> Self?
    func isEqual(rhs: Any) -> Bool
}

extension Int: Value {
    var rawUInt: UInt? {
        return nil
    }
    var rawFloat: Float? {
        return nil
    }
    var rawInt: Int? {
        return self
    }
    
    func operate(with operater: Operator) -> Int? {
        return operater.operate(lhs: self.rawInt!)
    }
    func isEqual(rhs: Any) -> Bool {
        guard let rhs = rhs as? Value else {
            return false
        }
        return rhs.rawInt == nil ? false : self.rawInt == rhs.rawInt!
    }

}

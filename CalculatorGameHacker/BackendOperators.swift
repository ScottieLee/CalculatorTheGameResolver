//
//  Operators.swift
//  CalculatorGameHacker
//
//  Created by Scott on 2017/9/21.
//  Copyright © 2017年 ScottLi. All rights reserved.
//

import Foundation
// +
infix operator ~+
// -
infix operator ~-
// *
infix operator ~*
// /
infix operator ~/
// append
infix operator ~|
// +/-
prefix operator ~^
// <<
prefix operator ~<<
// reverse
prefix operator ~~

infix operator ~=>

func ~+(lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
}

func ~-(lhs: Int, rhs: Int) -> Int {
    return lhs - rhs
}

func ~*(lhs: Int, rhs: Int) -> Int {
    return lhs * rhs
}

func ~/(lhs: Int, rhs: Int) -> Int? {
    if lhs % rhs != 0 {
        return nil
    }
    return lhs / rhs
}

func ~|(lhs: Int, rhs: UInt) -> Int {
    let concatedString = String(lhs) + String(rhs)
    return Int(concatedString)!
}

prefix func ~^(rhs: Int) -> Int {
    return -rhs;
}

prefix func ~<<(lhs: Int) -> Int {
    return lhs / 10
}

prefix func ~~(lhs: Int) -> Int? {
    let reversed = String(String(lhs).reversed())
    return Int(reversed)
}

typealias Repacement = (relacer: Int, replacee: Int)

func ~=>(lhs: Int, rhs: Repacement) -> Int? {
    let relacerStr = String(rhs.relacer)
    let relaceeStr = String(rhs.replacee)
    let valueStr = String(lhs)
    let resultStr = valueStr.replacingOccurrences(of: relaceeStr, with: relacerStr)
    return Int(resultStr)
}

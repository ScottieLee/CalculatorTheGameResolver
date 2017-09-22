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

func ~+(lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
}

func ~-(lhs: Int, rhs: Int) -> Int {
    return lhs - rhs
}

func ~*(lhs: Int, rhs: Int) -> Int {
    return lhs * rhs
}

func ~/(lhs: Int, rhs: Int) -> Int {
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

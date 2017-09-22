//
//  Operator.swift
//  CalculatorGameHacker
//
//  Created by Scott on 2017/9/21.
//  Copyright © 2017年 ScottLi. All rights reserved.
//

import Foundation

enum Operator {
    case add(rhs: Int)
    case minus(rhs: Int)
    case div(rhs: Int)
    case mult(rhs: Int)
    case cut
    case append(rhs: UInt)
    case flip
    case replace(replacer: Int, replacee: Int)
    case reverse
}

extension Operator {
    /*
     Supported Operators:
     +: +5
     -: -3
     *: *5
     /: /2
     <<: <<
     |: |5
     ^: ^
     ~: ~
     */
    init?(input: String) {
        // Parser
        if input.hasPrefix("+") {
            guard let rhs = input.rhsValueWithPattern(pattern: "+") else {
                return nil
            }
            self = .add(rhs: rhs)
        } else if input.hasPrefix("-") {
            guard let rhs = input.rhsValueWithPattern(pattern: "-") else {
                return nil
            }
            self = .minus(rhs: rhs)
        } else if input.hasPrefix("*") {
            guard let rhs = input.rhsValueWithPattern(pattern: "*") else {
                return nil
            }
            self = .mult(rhs: rhs)
        } else if input.hasPrefix("/") {
            guard let rhs = input.rhsValueWithPattern(pattern: "/") else {
                return nil
            }
            self = .div(rhs: rhs)
        } else if input.hasPrefix("<<") {
            self = .cut
        } else if input.hasPrefix("|") {
            guard let rhs = input.rhsValueWithPattern(pattern: "|") else {
                return nil
            }
            self = .append(rhs: UInt(rhs))
        } else if input.hasPrefix("^") {
            self = .flip
        } else if input.hasPrefix("~") {
            self = .reverse
        } else if input.range(of: "=>") != nil {
            fatalError("To implement")
        } else {
            return nil
        }
    }
    
    func operate(lhs: Int) -> Int? {
        switch self {
        case .add(let rhs):
            return lhs ~+ rhs
        case .minus(let rhs):
            return lhs ~- rhs
        case .mult(let rhs):
            return lhs ~* rhs
        case .append(let rhs):
            return lhs ~| rhs
        case .div(let rhs):
            return lhs ~/ rhs
        case .cut:
            return ~<<lhs
        case .flip:
            return ~^lhs
        case .reverse:
            return ~~lhs
        case .replace(let replacer, let replacee):
            fatalError("Not implemented")
        }
    }
    var desc: String {
        switch self {
        case .add(let rhs):
            return "+\(rhs)"
        case .minus(let rhs):
            return "-\(rhs)"
        case .mult(let rhs):
            return "*\(rhs)"
        case .append(let rhs):
            return "|\(rhs)"
        case .div(let rhs):
            return "/\(rhs)"
        case .cut:
            return "<<"
        case .flip:
            return "^"
        case .reverse:
            return "~"
        case .replace(let replacer, let replacee):
            fatalError("Not implemented")
        }

    }
}

extension String {
    fileprivate func rhsValueWithPattern(pattern: String) -> Int? {
        let rhsString = replacingOccurrences(of: pattern, with: "")
        let rhsVal = Int(rhsString)
        guard let rhsValUnwrapped = rhsVal else {
            return nil
        }
        return rhsValUnwrapped
    }
}


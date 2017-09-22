//
//  Resolver.swift
//  CalculatorGameHacker
//
//  Created by Scott on 2017/9/21.
//  Copyright © 2017年 ScottLi. All rights reserved.
//

import Foundation

protocol Resolver {
    init(initialValue: Value, targetValue: Value, nStep: UInt, operationStrings:[String])
    
    func resolve() -> [String]
}

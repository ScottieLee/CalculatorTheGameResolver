//
//  ExhaustiveResolver.swift
//  CalculatorGameHacker
//
//  Created by Scott on 2017/9/21.
//  Copyright © 2017年 ScottLi. All rights reserved.
//

import Foundation

class ExhaustiveResolver: Resolver {
    
    private let initialVal: Value
    private let targetVal: Value
    private let operators: [Operator]
    private let nStep: UInt
    private var indexes: [Int]
    required init(initialValue: Value, targetValue: Value, nStep: UInt, operationStrings: [String]) {
        self.initialVal = initialValue
        self.targetVal = targetValue
        self.nStep = nStep
        self.operators = operationStrings.map({ (string) in
            return Operator(input:string)!
        })
        self.indexes = [Int](repeatElement(0, count: Int(nStep)))
    }
    
    func resolve() -> [String] {
        var (success, operationString) = runOperatorChain()
        while true {
            if success {
                return operationString!
            }
            next()
            if isStepEnd {
                return ["There is no answer"]
            }
            (success, operationString) = runOperatorChain()
        }
    }
    
    private func runOperatorChain() -> (success: Bool, operations: [String]?) {
        var value = initialVal
        for operIndex in indexes {
            guard let result = value.operate(with: operators[operIndex]) else {
                break
            }
            value = result
        }
        if value .isEqual(rhs: targetVal) {
            return (true, indexes.map({ (index) in
                return operators[index].desc
            }))
        } else {
            return (false, nil)
        }
    }

    private var stepIndex: Int = 0
    private func next() {
        let opIndex = indexes[stepIndex]
        if opIndex == operators.count - 1 {
            var nextBitIndex = stepIndex
            while true {
                nextBitIndex = nextBitIndex + 1
                if indexes[nextBitIndex] < operators.count - 1 {
                    break
                }
            }
            indexes[nextBitIndex] = indexes[nextBitIndex] + 1
            for i in 0 ..< nextBitIndex {
                indexes[i] = 0
            }
            stepIndex = 0
        } else {
            indexes[stepIndex] = opIndex + 1
        }
    }
    private var isStepEnd: Bool {
        return (indexes.filter({ (element) -> Bool in
            return element < operators.count - 1
        }).count == 0)
    }
}

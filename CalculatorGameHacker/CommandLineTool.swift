//
//  CommandLineTool.swift
//  CalculatorGameHacker
//
//  Created by Scott on 2017/9/22.
//  Copyright © 2017年 ScottLi. All rights reserved.
//

import Foundation

enum OptionType: String {
    case initialValue = "i"
    case targetValue = "t"
    case nStep = "n"
    case operations = "o"
    case help = "h"
    case unknown
    
    init(value: String) {
        switch value {
        case "i": self = .initialValue
        case "t": self = .targetValue
        case "n": self = .nStep
        case "o": self = .operations
        case "h": self = .help
        default: self = .unknown
        }
    }
}

class CommandLineTool {
    
    private let consoleIO = ConsoleIO()
    
    func getOption(_ option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func interactiveMode() {
        //1
        consoleIO.writeMessage("Calculator: The Game. This program resolve problems of the game.")
        //2
        while true {
            //3
            var initial: Int!
            while true {
                consoleIO.writeMessage("Input initial value")
                if let val = Int(consoleIO.getInput()) {
                    initial = val
                    break
                }
                consoleIO.writeMessage("Input Error!")
            }
            var target: Int!
            while true {
                consoleIO.writeMessage("Input target value")
                if let val = Int(consoleIO.getInput()) {
                    target = val
                    break
                }
                consoleIO.writeMessage("Input Error!")
            }
            var nStep: Int!
            while true {
                consoleIO.writeMessage("Input number of steps")
                if let val = Int(consoleIO.getInput()) {
                    nStep = val
                    break
                }
                consoleIO.writeMessage("Input Error!")
            }
            var operations: [String]!
            while true {
                consoleIO.writeMessage("Input operations separated by space")
                let opers = consoleIO.getInput().split(separator: " ")
                if opers.count > 0 {
                    operations = opers.map({ (substr) in
                        return String(substr)
                    })
                    break
                }
                consoleIO.writeMessage("Input Error!")
            }
            
            let resolver = ExhaustiveResolver(initialValue: initial, targetValue: target, nStep: UInt(nStep), operationStrings: operations)
            let answer = resolver.resolve()
            consoleIO.writeMessage("Answer is \(answer) \n\n Press any key to continue.")
            let _ = consoleIO.getInput()
        }

    }
}

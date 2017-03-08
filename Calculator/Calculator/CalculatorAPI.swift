//
//  CalculatorAPI.swift
//  Calculator
//
//  Created by student on 3/7/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class CalculatorAPI
{
    private var accumulator = 0.0
    
    func setOperand(_ operand:Double)
    {
        accumulator = operand
    }
    
    private var pending : PendingBinaryInfo?
    
    private struct PendingBinaryInfo
    {
        var binaryFunction: (Double,Double)->Double
        var firstOperand : Double
    }
    
    func performOperation(_ symbol: String)
    {
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let associatedValue):
                accumulator = associatedValue
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executeBinaryOperation()
                pending = PendingBinaryInfo(binaryFunction : function,firstOperand:accumulator)
            case .Equals:
                executeBinaryOperation()
            }
        }
    }
    
    private func executeBinaryOperation()
    {
        if pending != nil
        {
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending=nil
        }
    }
    
    private var operations : Dictionary<String,Operation> =
        [
            "π" : Operation.Constant(M_PI),
            "e" : Operation.Constant(M_E),
            "√" : Operation.UnaryOperation(sqrt),
            "cos" : Operation.UnaryOperation(cos),
            "×" : Operation.BinaryOperation({ $0 * $1 }),
            "+" : Operation.BinaryOperation({ $0 + $1 }),
            "−" : Operation.BinaryOperation({ $0 - $1 }),
            "÷" : Operation.BinaryOperation({ $0 / $1 }),
            "=" : Operation.Equals,
            ]
    
    private enum Operation
    {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
    }
    
    var result : Double
        {
        get{
            return accumulator
        }
    }
}

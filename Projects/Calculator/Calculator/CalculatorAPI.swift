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
    private var internalProgram = [AnyObject]()
    
    func setOperand(_ operand:Double)
    {
        internalProgram.append(operand as AnyObject)
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
        internalProgram.append(symbol as AnyObject)
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
    
    private func clear()
    {
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    typealias PropertyList = AnyObject
    
    var program : PropertyList
        {
        get
        {
            return internalProgram as CalculatorAPI.PropertyList
        }
        
        set
        {
            clear()
            if let arrayofops = newValue as? [AnyObject]
            {
                for ops in arrayofops
                {
                    if let operand = ops as? Double{
                        setOperand(operand)
                    }
                    
                    else if let operand = ops as? String{
                        performOperation(operand)
                    }
                }
            }
        }
    }
}

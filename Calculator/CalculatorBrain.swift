//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Anton Shemerey on 5/3/16.
//  Copyright © 2016 Anton Shemerey. All rights reserved.
//

import Foundation

class CalculatorBrain {
  var accumulator = 0.0
  
  var result: Double {
    get {
      return accumulator
    }
  }
  
  enum Operation {
    case Constant(Double)
    case UnariOperation((Double) -> Double)
    case BinaryOperation((Double, Double) -> Double)
    case Equals
  }
  
  var operations: Dictionary<String, Operation> = [
    "C": Operation.Constant(0.0),
    "π": Operation.Constant(M_PI),
    "e": Operation.Constant(M_E),
    "√": Operation.UnariOperation(sqrt),
    "cos": Operation.UnariOperation(cos),
    "sin": Operation.UnariOperation(sin),
    "=": Operation.Equals,
  ]
  
  func setOperand(operand: Double) {
    accumulator = operand
  }
  
  func performOpration(action: String) -> Void {
    if let operation = operations[action] {
      switch operation {
        case .Constant(let val): accumulator = val
        case .UnariOperation(let function): accumulator = function(accumulator)
        case .Equals: break
        default: break
      }
    }
  }
}


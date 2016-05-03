//
//  ViewController.swift
//  Calculator
//
//  Created by Anton Shemerey on 5/3/16.
//  Copyright © 2016 Anton Shemerey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // represent input process
  var inTheMiddleOfInput = false
  var accumulator = 0.0
  
  var displayValue: Double {
    get {
      return Double(result.text!)!
    }
    
    set {
      result.text = String(newValue)
    }
  }
  
  // output result
  @IBOutlet var result: UILabel!
  
  @IBAction func performOperation(sender: UIButton) {
    if let action = sender.currentTitle {
      switch action {
      case "C":
        result.text = "0"
        accumulator = 0
        inTheMiddleOfInput = false
      case "=":
        let res = Double(result.text!)! + accumulator
        result.text = String(res)
        inTheMiddleOfInput = false
      case "+":
        accumulator = Double(result.text!)!
        result.text = "+"
        inTheMiddleOfInput = false
      case "×":
        accumulator = Double(result.text!)!
        result.text = "×"
        inTheMiddleOfInput = false
      default: return
      }
    }
  }
  
  struct accomulatedValue {
    let value: Double
    let type: String
  }
  
  @IBAction func touchDigit(sender: UIButton) {
    if let digit = sender.currentTitle {
      if inTheMiddleOfInput {
        result.text =  result.text! + digit
      } else {
        result.text = digit
      }
      
      inTheMiddleOfInput = true
    }
  }
}


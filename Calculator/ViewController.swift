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
  
  var brain = CalculatorBrain()
  
  @IBAction func performOperation(sender: UIButton) {
    if inTheMiddleOfInput {
      brain.setOperand(displayValue)
    }
    inTheMiddleOfInput = false
    
    if let mathSymbol = sender.currentTitle {
      brain.performOpration(mathSymbol)
    }
    
    displayValue = brain.result
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


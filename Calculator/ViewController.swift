//
//  ViewController.swift
//  Calculator
//
//  Created by Anton Shemerey on 5/3/16.
//  Copyright © 2016 Anton Shemerey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // output result
  @IBOutlet var result: UILabel!
  
  @IBAction func touchDigit(sender: UIButton) {
    if let digit = sender.currentTitle {
      result.text = digit
    }
  }
}


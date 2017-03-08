//
//  ViewController.swift
//  Calculator
//
//  Created by student on 3/7/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var touchedDigit: UILabel!
    private var typing = false
    
    @IBAction private func buttonPressed(_ sender: UIButton) {
        
        let currentTitle = sender.currentTitle!
        
        if(typing)
        {
            let digitTouched = touchedDigit.text!
            touchedDigit.text =  digitTouched + currentTitle
        }
            
        else
        {
            touchedDigit.text = currentTitle
        }
        
        typing = true
    }
    
    private var display : Double {
        get
        {
            return Double(touchedDigit.text!)!
        }
        
        set
        {
            touchedDigit.text = String(newValue)
        }
    }
    
    private var calculatorAPI = CalculatorAPI()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        
        if typing{
            calculatorAPI.setOperand(display)
            typing = false
        }
        
        if let mathOperation = sender.currentTitle
        {
            calculatorAPI.performOperation(mathOperation)
        }
        
        touchedDigit.text = String(calculatorAPI.result)
        
    }
}


//
//  ViewController.swift
//  RPNCalculator
//
//  Created by Imre Nadas on 2021. 10. 09..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayText: UITextView!
    
    @IBOutlet weak var feedbackText: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    let calc = CalcEngine()
    var operand = ""
    var newLine = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressNumBtn(_ sender: UIButton) {
        if(newLine){
            operand = (sender.titleLabel?.text!)!
            displayText.text.append(operand)
            newLine = false
        }else{
            let char = (sender.titleLabel?.text!)!
            operand.append(char)
            displayText.text!.append(char)
        }
    }
    
    
    @IBAction func enterPressed(_ sender: UIButton) {
        let num = Double(operand)!
        calc.addOperand(operand: num)
        displayText.text = displayText.text! + "\n"
        newLine = true
    }
    
    @IBAction func pressOperation(_ sender: UIButton) {
        let num = Double(operand)!
        calc.addOperand(operand: num)
        let operation = sender.titleLabel?.text!
        let result = calc.performOperation(operation: operation!)
        displayText.text = displayText.text! + "\n"
        displayText.text = displayText.text! + String(result.result!)
        feedbackText.text = result.feedback
    }
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
        displayText.text = ""
        calc.clearStack()
    }
}


//
//  CalcEngine.swift
//  RPNCalculator
//
//  Created by Imre Nadas on 2021. 10. 13..
//

import Foundation
import UIKit

class CalcEngine{
    var stack = [Double]()
    
    func addOperand(operand: Double){
        stack.append(operand)
    }
    
    func clearStack(){
        stack.removeAll()
    }
    
    func performOperation(operation: String) -> (result: Double?, feedback: String){
        let db = stack.count
        let first = stack[db-2]
        let second = stack[db-1]
        var result : Double = 0
        
        if(operation.elementsEqual("+")){
            result = first + second
        }else if(operation.elementsEqual("-")){
            result = first - second
        }else if(operation.elementsEqual("X")){
            result = first * second
        }else if(operation.elementsEqual("/")){
            result = first / second
        }
        
        return (result, "the result of the operation on \(first) and \(second) is \(result)")
    }
}

//
//  ViewController.swift
//  Caculator
//
//  Created by datNguyem on 16/09/2021.
//

import UIKit

enum Operation:String {
    case Sum = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "X"
    case Null = "Null"
}

final class ViewController: UIViewController {
    
    @IBOutlet private var numPad: [UIButton]!
    @IBOutlet private var opearators: [UIButton]!
    @IBOutlet private weak var resultLabel: UILabel!
    
    private var currentNumber = ""
    private var leftValue = ""
    private var rightValue = ""
    private var result = ""
    private var currentOperator: Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func numPadPress(_ sender: Any) {
        let button = sender as! UIButton
        guard let title = button.currentTitle else { return }
        
        switch title {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            currentNumber += title
            resultLabel.text = currentNumber
        case "AC":
            clearAll()
        case "Del":
            deleteLastNumber()
        case "+":
            calculating(operation: .Sum)
        case "-":
            calculating(operation: .Subtract)
        case "X":
            calculating(operation: .Multiply)
        case "/":
            calculating(operation: .Divide)
        case "=":
            calculating(operation: currentOperator)
        default:
            break
        }
    }
    
    private func calculating(operation: Operation) {
        if currentOperator != .Null {
            if !currentNumber.isEmpty {
                rightValue = currentNumber
                currentNumber = ""
                
                switch currentOperator {
                case .Sum:
                    result = (Double(leftValue)! + Double(rightValue)!).formatResult()
                case .Subtract:
                    result = (Double(leftValue)! - Double(rightValue)!).formatResult()
                case .Multiply:
                    result = (Double(leftValue)! * Double(rightValue)!).formatResult()
                case .Divide:
                    result = (Double(leftValue)! / Double(rightValue)!).formatResult()
                default:
                    break
                }
                leftValue = result
                resultLabel.text = result
            }
            currentOperator = operation
        } else {
            leftValue = currentNumber
            currentNumber = ""
            currentOperator = operation
        }
    }
    
    private func deleteLastNumber() {
        if !currentNumber.isEmpty {
            currentNumber.removeLast()
            resultLabel.text = currentNumber
        }
    }

    private func clearAll() {
        currentNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperator = .Null
        resultLabel.text = ""
    }
    
    private func setupView() {
        numPad.forEach { $0.currentTitle == "0" ? $0.makeRounded() :$0.makeCircle() }
        opearators.forEach { $0.makeCircle() }
        resultLabel.adjustsFontSizeToFitWidth = true
    }
}


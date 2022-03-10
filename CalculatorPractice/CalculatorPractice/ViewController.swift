//
//  ViewController.swift
//  CalculatorPractice
//
//  Created by Chae_Haram on 2022/03/09.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var calculateFormulaLabel: UILabel!
    @IBOutlet weak var calculationResultLabel: UILabel!
    
    var formula: String = ""
    var result: String = ""
    var num1: Double = 0.0
    var num2: Double = 0.0
    var oper: Operator = .plus
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    enum Operator: String {
        case plus = "+"
        case minus = "-"
        case multiple = "*"
        case divide = "/"
        case rem = "%"
    }
    
    func operation(a: Double, b: Double, op: Operator) -> Double {
        switch op {
        case .plus:
            return (a + b)
        case .minus:
            return (a - b)
        case .multiple:
            return (a * b)
        case .divide:
            return (a / b)
        case .rem:
            return a.truncatingRemainder(dividingBy: b)
        
        }
    }
    
    
    @IBAction func zeroButton(_ sender: UIButton) {
        formula.append("0")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        formula.append("1")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        formula.append("2")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        formula.append("3")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        formula.append("4")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        formula.append("5")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        formula.append("6")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        formula.append("7")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        formula.append("8")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        formula.append("9")
        calculateFormulaLabel.text = formula
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        formula.append("+")
        num1 = Double(calculationResultLabel.text!)!
        oper = .plus
        
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        formula.append("-")
        calculateFormulaLabel.text = formula
//        num1 = Double(calculationResultLabel.text!)!
        oper = .minus
        
    }
    
    @IBAction func multipleButton(_ sender: UIButton) {
        formula.append("*")
        calculateFormulaLabel.text = formula
//        num1 = Double(calculationResultLabel.text!)!
        oper = .multiple
    }
    
    @IBAction func devideButton(_ sender: UIButton) {
        formula.append("/")
        calculateFormulaLabel.text = formula
//        num1 = Double(calculationResultLabel.text!)!
        oper = .divide
    }
    
    @IBAction func remButton(_ sender: UIButton) {
        formula.append("%")
        calculateFormulaLabel.text = formula
//        num1 = Double(calculationResultLabel.text!)!
        oper = .rem
    }
    
    @IBAction func allClearButton(_ sender: UIButton) {
        calculateFormulaLabel.text = "0"
        calculationResultLabel.text = "0"
        formula = ""
        result = ""
        
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
    
//        num2 = Double(calculationResultLabel.text!)!
//        result = String(operation(a: num1, b: num2, op: oper))
//        calculationResultLabel.text = result
        formula = ""
        
    }
    
    @IBAction func positiveNegativeButton(_ sender: UIButton) {
        calculationResultLabel.text = "-\(result)"
    }
    
    @IBAction func dotButton(_ sender: UIButton) {

    }

}


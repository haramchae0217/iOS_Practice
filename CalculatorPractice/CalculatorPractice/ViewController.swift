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
    var oper: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func makeFormula(keypadChar: String) {
        formula.append(keypadChar)
        calculateFormulaLabel.text = formula
        calculationResultLabel.text = formula
    }
    
    func operation(a: Double, b: Double, op: Int) -> Double {
        switch op {
        case 1:
            return (a + b)
        case 2:
            return (a - b)
        case 3:
            return (a * b)
        case 4:
            return (a / b)
        case 5:
            return a.truncatingRemainder(dividingBy: b)
        default:
            return 0
        }
    }
    
    
    @IBAction func zeroButton(_ sender: UIButton) {
        makeFormula(keypadChar: "0")
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        makeFormula(keypadChar: "1")
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        makeFormula(keypadChar: "2")
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        makeFormula(keypadChar: "3")
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        makeFormula(keypadChar: "4")
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        makeFormula(keypadChar: "5")
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        makeFormula(keypadChar: "6")
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        makeFormula(keypadChar: "7")
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        makeFormula(keypadChar: "8")
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        makeFormula(keypadChar: "9")
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        makeFormula(keypadChar: "+")
        num1 = Double(calculationResultLabel.text!)!
        oper = 1
        
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        makeFormula(keypadChar: "-")
        num1 = Double(calculationResultLabel.text!)!
        oper = 2
        
    }
    
    @IBAction func multipleButton(_ sender: UIButton) {
        makeFormula(keypadChar: "*")
        num1 = Double(calculationResultLabel.text!)!
        oper = 3
    }
    
    @IBAction func devideButton(_ sender: UIButton) {
        makeFormula(keypadChar: "/")
        num1 = Double(calculationResultLabel.text!)!
        oper = 4
    }
    
    @IBAction func remButton(_ sender: UIButton) {
        makeFormula(keypadChar: "%")
        num1 = Double(calculationResultLabel.text!)!
        oper = 5
    }
    
    @IBAction func allClearButton(_ sender: UIButton) {
        calculateFormulaLabel.text = "0"
        calculationResultLabel.text = "0"
        formula = ""
        result = ""
        
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        formula = ""
        num2 = Double(calculationResultLabel.text!)!
        result = String(operation(a: num1, b: num2, op: oper))
        calculationResultLabel.text = result
        
        
    }
    
    @IBAction func positiveNegativeButton(_ sender: UIButton) {
        calculationResultLabel.text = "-\(result)"
    }
    
    @IBAction func dotButton(_ sender: UIButton) {

    }

}


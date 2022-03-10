//
//  CalcViewController.swift
//  Calculator
//
//  Created by Chae_Haram on 2021/12/23.
//

import UIKit


// 1번 계산기
class CalcViewController: UIViewController {

    //MARK: Properties
    var formula: String = ""
    var result: String = ""
    
    //MARK: UI
    @IBOutlet weak var formulaLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: View Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: ETC Func
    func makeFormula(keypadChar: String) {
        formula.append(keypadChar)
        formulaLabel.text = formula
    }
    
    
    
    
    //MARK: Actions
    @IBAction func clearButton(_ sender: UIButton) {
        formulaLabel.text = "0"
        formula = ""
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
    
    @IBAction func dotButton(_ sender: UIButton) {
        makeFormula(keypadChar: ".")
    }
    
    //MARK: calcButton
    @IBAction func plusButton(_ sender: UIButton) {
        makeFormula(keypadChar: "+")
        
        
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        
    }
    
    @IBAction func multipleButton(_ sender: UIButton) {
    
    }
    
    @IBAction func devideButton(_ sender: UIButton) {
    
    }
    
    @IBAction func remButton(_ sender: UIButton) {
    
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        print("=")
        resultLabel.text = result
    }
    
    

}

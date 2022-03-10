//
//  InchTransViewController.swift
//  Calculator
//
//  Created by Chae_Haram on 2021/12/23.
//

import UIKit


// 2번 인치 변환기
class InchTransViewController: UIViewController {

    // property
    
    
    // ui
    @IBOutlet weak var inchTextField: UITextField!
    @IBOutlet weak var transButton: UIButton!
    @IBOutlet weak var resultLable: UILabel!
    // view life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // configure
    
    // etc func
    
    // action func
    @IBAction func transButtonCliked(_ sender: UIButton) {
        print("button clicked")
        
        // 1. textField에 있는 글자 받아오기
        let text = inchTextField.text!
        
        // optional unwrapping : if let, guard
//        let doubleValue = Double(text) ?? 0
        if let doubleValue = Double(text) {
            // 2. textField에서 받아온 inch를 cm으로 계산
            var result = doubleValue * 2.54
            
            // 2-1 소수점 둘째자리
            result = round(result * 100) / 100
            
            // 3. 계산한 값을 label에 보여주기
            resultLable.text = "\(result) cm"
        } else {
            resultLable.text = "입력이 올바르지 않습니다."
        }
        
        
    }
    
    

    
}


// extension

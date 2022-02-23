//
//  ViewController.swift
//  EnumPractice
//
//  Created by Chae_Haram on 2022/02/23.
//

import UIKit

/*
 switch버튼을 누르면 상태가 변경
 전구를 껐다 켰다하는 스위치
 off, on의 두가지 상태 존재
 
 전구가 꺼지면 배경을 검정색,  글씨는 노랑색
 전구가 켜지면 배경을 노랑색, 글씨는 검정색
 */

class ViewController: UIViewController {

    // enum
    enum State: String {
        case off
        case on
    }
    
    // property
    var state: State = .off
    
    // ui
    @IBOutlet weak var stateLabel: UILabel!
    
    // view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //action
    @IBAction func switchButton(_ sender: UIButton) {
        // isSelected = false -> 꺼짐
        // isSelected = true - > 켜짐
        
        // state가 on이냐 off냐로 달라짐
        
        stateLabel.text = state.rawValue
        
        switch state {
        case .off:
            view.backgroundColor = .black
            stateLabel.textColor = .yellow
            state = .on
        case .on:
            view.backgroundColor = .yellow
            stateLabel.textColor = .black
            state = .off
        }
        
    }
    
}


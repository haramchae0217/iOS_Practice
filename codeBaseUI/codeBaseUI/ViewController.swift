//
//  ViewController.swift
//  codeBaseUI
//
//  Created by Chae_Haram on 2022/08/10.
//

import UIKit

class ViewController: UIViewController {

     // 1. 객체 만들기
    let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "label 1"
        label.backgroundColor = .cyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. 객체 속성 설정
//        firstLabel.text = "Label 1"
//        firstLabel.backgroundColor = .cyan
//        firstLabel.translatesAutoresizingMaskIntoConstraints = false // 자동 위치 못잡게 설정
        
        // 3. 뷰에 label 추가하기
        view.addSubview(firstLabel) // 스토리보드에서 + 버튼을 눌러서 레이블을 화면에 끌어 당겨놓는것
        
        // 4. 제약조건 설정
        // leading, trailing, top, bottom, centerX, centerY
        let safeArea = view.safeAreaLayoutGuide
        let leadingConstraint = firstLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
        let tralingConstraint = firstLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        let topConstraint = firstLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40)
        
        leadingConstraint.isActive = true
        tralingConstraint.isActive = true
        topConstraint.isActive = true
        
    }


}


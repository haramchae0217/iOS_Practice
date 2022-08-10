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
        label.text = "Label 1"
        label.backgroundColor = .cyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Label 2"
        label.backgroundColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "Label 3"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button 1", for: .normal)
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button 2", for: .normal)
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. 객체 속성 설정
//        firstLabel.text = "Label 1"
//        firstLabel.backgroundColor = .cyan
//        firstLabel.translatesAutoresizingMaskIntoConstraints = false // 자동 위치 못잡게 설정
        
        // 3. 뷰에 label 추가하기
        addSubViews()
        
        // 4. 제약조건 설정
        // leading, trailing, top, bottom, centerX, centerY
        setConstraints()
        
        secondButton.addTarget(self, action: #selector(moveSecondVC), for: .touchUpInside)
        
        
    }
    // 뷰에 객체를 추가하는 함수
    func addSubViews() {
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(firstButton)
        horizontalStackView.addArrangedSubview(secondButton)
    }
    
    
    // 제약조건을 설정하는 함수
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        // firstLabel
        firstLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        firstLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        firstLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40).isActive = true
        
        // secondLabel
        secondLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor).isActive = true
        secondLabel.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor).isActive = true
        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 10).isActive = true
        
        // thirdLabel
        thirdLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor).isActive = true
        thirdLabel.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor).isActive = true
        thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 10).isActive = true
        
        // HorizontalstackView
        horizontalStackView.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor).isActive = true
        horizontalStackView.topAnchor.constraint(equalTo: thirdLabel.bottomAnchor, constant: 100).isActive = true
        
    }
    
    /// SecondButton에 대한 액션
    @objc func moveSecondVC() {
        let vc = SecondViewController()
        
        self.present(vc, animated: true)
    }
}


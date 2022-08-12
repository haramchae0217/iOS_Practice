//
//  SecondViewController.swift
//  codeBaseUI
//
//  Created by Chae_Haram on 2022/08/10.
//

import UIKit

/*
 1. 초록버튼 - 텍스트 필드에 입력한 내용이 얼럿으로 뜨도록 구현 (0)
 2. 빨간버튼 - 텍스트 필드가 비워지게 구현 (0)
 */

class SecondViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "얼럿 문구 지정: "
        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "문구를 작성해주세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("얼럿 띄우기", for: .normal)
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("문구 초기화", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        addSubViews()
        setConstraints()
        
        firstButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(cleanTextField), for: .touchUpInside)
        
    }
    
    func addSubViews() {
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(firstButton)
        verticalStackView.addArrangedSubview(secondButton)
    }
    
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        // label
        label.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50).isActive = true
        label.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50).isActive = true
        label.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        
        // textField
        textField.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        
        // stackView
        verticalStackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50).isActive = true
        verticalStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "⚠️", message: textField.text, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alert.addAction(doneButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func cleanTextField() {
        textField.text = ""
    }

}

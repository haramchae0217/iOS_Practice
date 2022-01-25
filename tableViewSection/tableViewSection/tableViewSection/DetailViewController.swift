//
//  DetailViewController.swift
//  tableViewSection
//
//  Created by Chae_Haram on 2022/01/25.
//

import UIKit

// 1. 화면 전환
// 2. 완료 barButton 만들어주기
// 3. 완료를 눌렀을 때 action : 이전 화면의 테이블뷰에 바뀐 정보 반영하기
class DetailViewController: UIViewController {

    @IBOutlet weak var contentTextField: UITextField!
    
    var content: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(content)
        contentTextField.text = content
        
        
    }
    
}

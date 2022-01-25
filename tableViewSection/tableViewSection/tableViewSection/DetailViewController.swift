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
    var row: Int? //datas의 몇번째 정보인지 == tableView에 몇번째에 있는지
    var section: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRightBarButtonItem()
        contentTextField.text = content
        
    }
    
    func createRightBarButtonItem() {
        let rightBarButton: UIBarButtonItem = UIBarButtonItem(title: "수정하기", style: .done, target: self, action: #selector(updateButtonClicked))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    @objc func updateButtonClicked() {
        // 1. VC에 접근하기
        guard let VC = self.storyboard?.instantiateViewController(withIdentifier: "VC") as? ViewController else{ return }
        // 2. 값 대입해주기
        if let row = row{
            VC.datas[row] = contentTextField.text!
            self.navigationController?.pushViewController(VC, animated: true)
        } else {
            print("인덱스 값이 비어있음.")
        }
    
    }
}

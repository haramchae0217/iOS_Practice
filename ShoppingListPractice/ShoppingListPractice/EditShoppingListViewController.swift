//
//  EditShoppingListViewController.swift
//  ShoppingListPractice
//
//  Created by Chae_Haram on 2022/03/02.
//

import UIKit

class EditShoppingListViewController: UIViewController {

    @IBOutlet weak var editListTextField: UITextField!
    
    var row: Int?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = name {
            editListTextField.text = name
        }
        
    }
    
    @IBAction func editListButton(_ sender: UIButton) {
        let editItem = editListTextField.text!
        if editItem.isEmpty {
            UIAlertController.showAlert(message: "목록을 입력하세요.", vc: self)
            return
        }
        // 2. 대입
        //한줄 표기
         if let row = row {
             Shopping.ShoppingList[row].title = editItem
         }
        
        // 3. [선택] 수정이 되는 순간 이전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }
    
    

}

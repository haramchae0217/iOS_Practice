//
//  EditShoppingListViewController.swift
//  ShoppingList
//
//  Created by Chae_Haram on 2022/02/23.
//

import UIKit

class EditShoppingListViewController: UIViewController {

    @IBOutlet weak var editShoppingListTextField: UITextField!
    
    var name: String?
    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = name {
            editShoppingListTextField.text = name
        }
        
    }
    
    @IBAction func editShoppingListButton(_ sender: UIButton) {
        // 1. 변경된 이름 필요
        let editItem = editShoppingListTextField.text!
        if editItem.isEmpty {
            UIAlertController.showAlert(message: "목록을 입력하세요.", vc: self)
            return
        }
        // 2. 대입
        if let row = row {
            let item = ShoppingItem.shoppingList[row]
            item.name = editItem
        }
        /* 한줄 표기
         if let row = row {
             ShoppingItem.shoppingList[row].name = editItem
         }
         */
    
        
        // 3. [선택] 수정이 되는 순간 이전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
        
        // 4. viewController > tableView 갱신
        /*
         override func viewWillAppear(_ animated: Bool) {
             tableView.reloadData()
         }
         */
        
    }
    

}

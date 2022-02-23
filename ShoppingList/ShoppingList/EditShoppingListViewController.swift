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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = name {
            editShoppingListTextField.text = name
        }
        
    }
    
    @IBAction func editShoppingListButton(_ sender: UIButton) {
        let editList = editShoppingListTextField.text!
        if editList.isEmpty {
            UIAlertController.showAlert(message: "목록을 수정하세요.", vc: self)
            return
        }
        
        let newList = ShoppingItem.shoppingList
        
    }
    

}

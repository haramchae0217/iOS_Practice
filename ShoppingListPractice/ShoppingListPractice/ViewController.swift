//
//  ViewController.swift
//  ShoppingListPractice
//
//  Created by Chae_Haram on 2022/03/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shoppingListTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func addShoppingListButton(_ sender: UIButton) {
        let shopping = shoppingListTextField.text!
        if shopping.isEmpty {
            UIAlertController.showAlert(message: "리스트를 입력하세요.", vc: self)
            return
        }
        Shopping.ShoppingList.append(Shopping(title: shoppingListTextField.text!))
        self.tableView.reloadData()
    }
    
    @objc func checkButtonClicked(_ sender: UIButton) {
        // if selcted -> 빈 체크박스 그림
        // if not selected -> 색칠된 체크박스 그림
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.isSelected = false
            Shopping.ShoppingList[sender.tag].isChecked = false
        } else {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            sender.isSelected = true
            Shopping.ShoppingList[sender.tag].isChecked = true
        }
        print(Shopping.ShoppingList[sender.tag].isChecked)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell() }
        
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        cell.shoppingListLabel.text = Shopping.ShoppingList[indexPath.row].title
        cell.checkButton.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Shopping.ShoppingList.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

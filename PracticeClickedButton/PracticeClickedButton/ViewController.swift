//
//  ViewController.swift
//  PracticeClickedButton
//
//  Created by Chae_Haram on 2022/02/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addListTextField: UITextField!
    @IBOutlet weak var shoppingListTableView: UITableView!
    
    var shoppingList: [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingListTableView.delegate = self
        shoppingListTableView.dataSource = self
        
    }
    @IBAction func addListButton(_ sender: UIButton) {
        let list = addListTextField.text!
        if list.isEmpty {
            UIAlertController.showAlert(message: "추가 목록을 입력하세요.", vc: self)
            return
        }
        shoppingList.append(List(title: addListTextField.text!))
        self.shoppingListTableView.reloadData()
    }
    
    @objc func checkButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.isSelected = false
            shoppingList[sender.tag].isChecked = false
        } else {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            sender.isSelected = true
            shoppingList[sender.tag].isChecked = true
        }
    }
    

}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingList", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell() }
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        cell.titleLabel.text = shoppingList[indexPath.row].title
        cell.checkButton.tag = indexPath.row
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

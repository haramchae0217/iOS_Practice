//
//  ViewController.swift
//  SelfShoppingList
//
//  Created by Chae_Haram on 2022/02/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputListTextField: UITextField!
    
    var list: [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    @IBAction func inputListButton(_ sender: UIButton) {
        let addList = inputListTextField.text!
        if addList.isEmpty {
//            UIAlertController.showAlert(message: "추가 목록을 입력하세요.", vc: self)
            return
        }
        list.append(List(list: inputListTextField.text!))
        self.tableView.reloadData()
    }
    @objc func checkButtonClicked(_ sender: UIButton) {
        // if selcted -> 빈 체크박스 그림
        // if not selected -> 색칠된 체크박스 그림
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.isSelected = false
            list[sender.tag].isChecked = false
        } else {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            sender.isSelected = true
            list[sender.tag].isChecked = true
        }
        print(list[sender.tag].isChecked)
    }
   
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listTV", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.listCheckButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        cell.listTitleLabel.text = list[indexPath.row].list
        cell.listCheckButton.tag = indexPath.row
        

        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


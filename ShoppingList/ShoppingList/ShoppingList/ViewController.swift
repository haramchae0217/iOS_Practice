//
//  ViewController.swift
//  ShoppingList
//
//  Created by Chae_Haram on 2022/02/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ShoppingListTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let shoppingList: [ShoppingItem] = [
        ShoppingItem(name: "apple"),
        ShoppingItem(name: "banana"),
        ShoppingItem(name: "kiwi")
    ]
    
//    var checkedList: [ShoppingItem] = [ShoppingItem(name: "커피")]
//    var notCheckedList: [ShoppingItem] = [ShoppingItem(name: "차"), ShoppingItem(name: "집")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addShoppingListButton(_ sender: UIButton) {
        
        
    }
    
    @objc func checkButtonClicked(_ sender: UIButton) {
        // if selcted -> 빈 체크박스 그림
        // if not selected -> 색칠된 체크박스 그림
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.isSelected = false
            shoppingList[sender.tag].isChecked = false
        } else {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            sender.isSelected = true
            shoppingList[sender.tag].isChecked = true
        }
        print(shoppingList[sender.tag].isChecked)
    }
    

}

extension ViewController: UITableViewDataSource {
    //섹션 2개 만들기
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 섹션0, 1에 따라 뿌려줄 cell의 갯수 다름
        return shoppingList.count
//        if section == 0 {
//            return notCheckedList.count
//        } else {
//            return checkedList.count
//        }
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "구매할 항목"
//        } else {
//            return "구매한 항목"
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell() }
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        cell.listLabel.text = shoppingList[indexPath.row].name
        cell.checkButton.tag = indexPath.row
        
        //indexpath.section = 0 ,1이냐에 따라 뿌려줄 데이터
//        if indexPath.section == 0 {
//            cell.listLabel.text = notCheckedList[indexPath.row].name
//        } else {
//            cell.listLabel.text = checkedList[indexPath.row].name
//        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// 구조체, 클래스, 배열, 조건문, 반복문

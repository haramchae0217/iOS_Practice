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
    
   
//    var checkedList: [ShoppingItem] = [ShoppingItem(name: "커피")]
//    var notCheckedList: [ShoppingItem] = [ShoppingItem(name: "차"), ShoppingItem(name: "집")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func addShoppingListButton(_ sender: UIButton) {
        let list = ShoppingListTextField.text!
        if list.isEmpty {
            UIAlertController.showAlert(message: "추가 목록을 입력하세요.", vc: self)
            return
        }
        ShoppingItem.shoppingList.append(ShoppingItem(name: ShoppingListTextField.text!))
        self.tableView.reloadData()
        
    }
    
    @objc func checkButtonClicked(_ sender: UIButton) {
        // if selcted -> 빈 체크박스 그림
        // if not selected -> 색칠된 체크박스 그림
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.isSelected = false
            ShoppingItem.shoppingList[sender.tag].isChecked = false
        } else {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            sender.isSelected = true
            ShoppingItem.shoppingList[sender.tag].isChecked = true
        }
        print(ShoppingItem.shoppingList[sender.tag].isChecked)
    }
    

}

extension ViewController: UITableViewDataSource {
    //섹션 2개 만들기
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 섹션0, 1에 따라 뿌려줄 cell의 갯수 다름
        return ShoppingItem.shoppingList.count
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
        cell.listLabel.text = ShoppingItem.shoppingList[indexPath.row].name
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ShoppingItem.shoppingList.remove(at: indexPath.row)
            // 실제 배열 안의 값을 지움
            tableView.deleteRows(at: [indexPath], with: .fade)
            // 사라지는 방향
        } else {
            print("insert")
        }
        // 어디에 있는 줄을 지울것인가
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. 어느 화면으로 전환해줄건지 선언
        guard let editVC = self.storyboard?.instantiateViewController(withIdentifier: "editShoppingListVC") as? EditShoppingListViewController else { return }
        // 2. 화면 전환해주기 전에 해주어야될 설정
        editVC.name = ShoppingItem.shoppingList[indexPath.row].name

        // editVC.view.backgroundColor = .red
        // editVC.modalPresentationStyle = .fullScreen
        // 3. 화면전환 -> push<->pop, present<->dismiss
        //present(editVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(editVC, animated: true)
        // navigationController가 없을수도 있어서 옵셔널
    }
}

// 구조체, 클래스, 배열, 조건문, 반복문

/*
 프로퍼티
 
 인스턴스 - 클래스의 구조로 컴퓨터 저장공간에서 할당된 실체를 의미. (메모리에 실질적으로 적재되어 값이 할당됨), 클래스는 속성(프로퍼티)과 행위(함수)로 구성된 일종의 설계도
 
 구조체, 클래스, 객체
 
 
 */

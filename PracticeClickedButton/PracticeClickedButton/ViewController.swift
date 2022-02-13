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
        /*
         addListTextFiled가 비었으면 UIAlertController를 통해 알림창을 띄워주고
         값이 있다면 List 클래스에 있는 title변수에 addListTextField의 text값을 추가
         shoppingListTableView의 데이터를 리로드함.
         */
    }
    
    @objc func checkButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "check.mark"), for: .normal)
            sender.isSelected = false
            shoppingList[sender.tag].isChecked = false
        } else {
            sender.setImage(UIImage(systemName: "check.mark.fill"), for: .normal)
            sender.isSelected = true
            shoppingList[sender.tag].isChecked = true
        }
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
        // shoppingList의 갯수를 한 Section안에 Row 수로 지정
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingList", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell() }
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        cell.titleLabel.text = shoppingList[indexPath.row].title
        cell.checkButton.tag = indexPath.row
        return cell
        /*
         지정된 재사용 식별자에 대한 재사용 가능한 테이블 뷰 셀 객체를 반환하고,이를 테이블에 추가합니다
         'shoppingList'라는 identifier에 접근해 셀 객체를 반환하는데 만약 그 이름을 가진 identifier가 없다면 UITableViewCell()을 리턴
         */
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        //row의 높이 지정
    }
}

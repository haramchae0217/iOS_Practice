//
//  RealmViewController.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/31.
//

import UIKit
import RealmSwift

/*
 1. 클래스 상단에 빈 배열 선언
 2. 그 빈 배열에 realm에서 가져온 배열 데이터 담아주기
 3. 저장 버튼 눌렀을 때 텍스트 필드 안에 내용을 가져와서 배열에 추가
 4. 저장한 배열을 다시 realm에 저장
 5. 테이블 뷰 갱신
 */

class RealmViewController: UIViewController {
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var shoppingListTableView: UITableView!
    
    let localRealm = try! Realm()
    var shoppingList: [ShoppingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findRealmLocation()
        configureTableView()
        shoppingList = getData()
    }
    
    func configureTableView() {
        shoppingListTableView.dataSource = self
        shoppingListTableView.delegate = self
    }
    
    func findRealmLocation() {
        print("Realm Location: ",localRealm.configuration.fileURL ?? "cannot find location")
    }
    
    func getData() -> [ShoppingItem] {
        return localRealm.objects(ShoppingItem.self).map { $0 }
    }
    
    func addData(item: ShoppingItem) {
        try! localRealm.write {
            localRealm.add(item)
        }
    }
    
    @IBAction func addItemButtonClicked(_ sender: UIButton) {
        let itemName = itemNameTextField.text!
        let list = List<String>()
        itemName.components(separatedBy: " ").forEach { str in
            list.append(str)
        }
        let shoppingItem = ShoppingItem(list: list)
        
        addData(item: shoppingItem)
        shoppingList = getData()
        
        shoppingListTableView.reloadData()
    }
}

extension RealmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension RealmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier, for: indexPath) as? ShoppingTableViewCell else { return UITableViewCell() }
        cell.itemNameLabel.text = shoppingList[indexPath.row].list.map { $0 }.joined(separator: " ")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
}

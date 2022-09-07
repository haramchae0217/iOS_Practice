//
//  AddToDoViewController.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/28.
//

import UIKit
import RealmSwift

class AddToDoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var memoTextField: UITextField!
    
    let localRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRightBarButtonItem()
    }
    
    func addToDo(todo: ToDo) {
        try! localRealm.write {
            localRealm.add(todo)
        }
    }
    
    func configureRightBarButtonItem() {
        let rightBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(doneButtonClicked))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func doneButtonClicked() {
        let title = titleTextField.text!
        let memo = memoTextField.text!
        let memoList = List<String>()
        memo.components(separatedBy: " ").forEach { str in
            memoList.append(str)
        }
        let todo = ToDo(title: title, descList: memoList)
        
        addToDo(todo: todo)
        
        self.navigationController?.popViewController(animated: true)
    }

}

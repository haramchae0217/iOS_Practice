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
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    let localRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRightBarButtonItem()
    }
    
    func configureRightBarButtonItem() {
        let rightBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(doneButtonClicked))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func doneButtonClicked() {
        let title = titleTextField.text!
        let desc = memoTextField.text!
        let startDate = startDatePicker.date
        let endDate = endDatePicker.date
        let todo = ToDo(title: title, desc: desc)
        
        try! localRealm.write {
            localRealm.add(todo)
        }
        
    }

}

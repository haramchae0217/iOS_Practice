//
//  ToDoViewController.swift
//  ToDoDiaryPractice
//
//  Created by Chae_Haram on 2022/03/18.
//

import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet weak var todoTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ToDo"
        
        let rightBarButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(createBarButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        
    }
    @objc func createBarButton() {
        let toDoTitle = todoTitleTextField.text!
        Main.mainData.append(Main(type: "ToDo", title: toDoTitle))
        
        self.navigationController?.popViewController(animated: true)
    }
    

}

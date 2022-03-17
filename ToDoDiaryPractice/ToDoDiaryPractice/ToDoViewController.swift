//
//  ToDoViewController.swift
//  ToDoDiaryPractice
//
//  Created by Chae_Haram on 2022/03/18.
//

import UIKit

class ToDoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ToDo"
        
        let rightBarButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(createBarButton))
        
        
    }
    @objc func createBarButton() {
        self.navigationController?.popViewController(animated: true)
    }
    

}

//
//  ToDoViewController.swift
//  ToDoDiaryPractice
//
//  Created by Chae_Haram on 2022/03/18.
//

import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet weak var todoTitleTextField: UITextField!
    // todoVC인게 확실하니 그냥 titleTextField로!
    // 이름이 너무 김 최대한 간결하게 줄여보자 단, 같은 outlet요소가 여러개일 경우는 길어질 수 밖에 없음.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ToDo"
        
        let doneRightBarButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(toDoAddButton))
        self.navigationItem.rightBarButtonItem = doneRightBarButton
    }
    
    @objc func toDoAddButton() {
        let toDoTitle = todoTitleTextField.text!
        let newToDo = Item(type: "ToDo", title: toDoTitle)
        
        // init 쓰지말고 새로운 인스턴스를 만들어 사용하기.
        
        Item.itemData.append(newToDo)
        self.navigationController?.popViewController(animated: true)
        // 버튼 네이밍 다시.
    }
    
}
// 다이어리 VC도 똑같이 네이밍

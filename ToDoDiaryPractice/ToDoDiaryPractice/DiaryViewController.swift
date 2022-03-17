//
//  DiaryViewController.swift
//  ToDoDiaryPractice
//
//  Created by Chae_Haram on 2022/03/18.
//

import UIKit

class DiaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Diary"
        
        let rightBarButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(createBarButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    @objc func createBarButton() {
        self.navigationController?.popViewController(animated: true)
    }
    

}

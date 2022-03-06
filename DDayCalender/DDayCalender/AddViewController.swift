//
//  AddViewController.swift
//  DDayCalender
//
//  Created by Chae_Haram on 2022/03/06.
//

import UIKit

class AddViewController: UIViewController {

    // UI
    @IBOutlet weak var anniImageView: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextField!
    
    // Properties
    var dday: Anniversary?
    var row: Int?
    
    // View Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let dday = dday {
            datePicker.date = dday.targetDate
            titleTextField.text = dday.title
        }
        
        let rightBarButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // Configure
    
    // Action
    @IBAction func addImageButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc func saveButton() {
        //print("saved")
        //print(datePicker.date)
        // 1. 날짜 정보, 타이틀 정보를 Anniversary 타입으로 기념일 만들어주기
        let title = titleTextField.text!
        let anniversary = Anniversary(title: title, targetDate: datePicker.date)
        // 2. 기념일을 ddayList에 추가하기
        if let row = row {
            Anniversary.ddayList[row] = anniversary
        } else {
            Anniversary.ddayList.append(anniversary)
        }
        // 3. 이전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }

}

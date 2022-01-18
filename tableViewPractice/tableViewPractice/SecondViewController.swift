//
//  SecondViewController.swift
//  tableViewPractice
//
//  Created by Chae_Haram on 2022/01/18.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //UI
    let todoList: [String] = ["밥먹기", "공부하기", "겜하기","산책하기", "알바가기", "과제하기","잠자기"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "두번째 화면"
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    @IBAction func saveButton(_ sender: UIButton) {
        //버튼 클릭 시, 이전버튼으로 이동
        //self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    // table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count // 몇개의 줄을 보여줄지 반환
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? SecondTableViewCell else { return UITableViewCell() }
        let todo = todoList[indexPath.row]
        cell.toDoLabel.text = todo
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    } // tablr view cell 높이 설정


}

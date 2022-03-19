//
//  ViewController.swift
//  ToDoDiaryPractice
//
//  Created by Chae_Haram on 2022/03/18.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    let heightForRow: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainTableView.reloadData()
    }

    func showAlertSheet() {
        let alertAction = UIAlertController(title: "글 작성하기", message: "어떤종류를 작성하시겠습니까?", preferredStyle: .actionSheet)
        
        let todo = UIAlertAction(title: "ToDo", style: .default) { _ in
            guard let addToDo = self.storyboard?.instantiateViewController(withIdentifier: "addToDo") as? ToDoViewController else { return }
            self.navigationController?.pushViewController(addToDo, animated: true)
        }
        
        let diary = UIAlertAction(title: "Diary", style: .default) { _ in
            guard let addDiary = self.storyboard?.instantiateViewController(withIdentifier: "addDiary") as? DiaryViewController else { return }
            self.navigationController?.pushViewController(addDiary, animated: true)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertAction.addAction(todo)
        alertAction.addAction(diary)
        alertAction.addAction(cancelButton)
        self.present(alertAction, animated: true, completion: nil)
    }
    
    @IBAction func rightBarButton(_ sender: UIBarButtonItem) {
        showAlertSheet()
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: "Main", for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        let item = Item.itemData[indexPath.row]
        cell.typeLabel.text = item.type
        
        if item.type == "ToDo" {
            cell.typeLabel.textColor = .blue
        } else {
            cell.typeLabel.textColor = .red
        }
        
        cell.titleLabel.text = item.title
        cell.dateLabel.text = DateFormatter.customDateFormatter.toStringFromDate(target: item.date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Item.itemData.count
    }
    // 삭제 구현하기
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Item.itemData.remove(at: indexPath.row)
            mainTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow
        // return값을 상수로 지정해서 사용해보기.
    }
}

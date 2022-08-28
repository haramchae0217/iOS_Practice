//
//  ToDoViewController.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/28.
//

import UIKit
import RealmSwift

class ToDoViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    let localRealm = try! Realm()
    var todoList: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        todoTableView.reloadData()
    }
    
    func configureTableView() {
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
    
    func getToDo() {
        let todo = localRealm.objects(ToDo.self)
        
        for item in todo {
            todoList.append(item)
        }
        
    }

    @IBAction func addToDoButton(_ sender: UIBarButtonItem) {
        guard let addToDo = storyboard?.instantiateViewController(withIdentifier: "AddToDoVC") as? AddToDoViewController else { return }
        
        self.navigationController?.pushViewController(addToDo, animated: true)
    }
    
}

extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.identifier, for: indexPath) as? ToDoTableViewCell else { return UITableViewCell() }
        
        let todo = localRealm.objects(ToDo.self)
        
        cell.todoTitleLabel.text = todo[indexPath.row].title
        cell.todoEndDateLabel.text = "만료일 : \(todo[indexPath.row].endDate)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return
    }
}

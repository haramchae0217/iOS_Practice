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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addUser()
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
    
    let todo1 = ToDo(title: "todo1", desc: "test todo1")
    let todo2 = ToDo(title: "todo2", desc: "test todo2")
    let todo3 = ToDo(title: "todo3", desc: "test todo3")
    
    let idCard1 = IDCard(idNumber: "0001")
    let idCard2 = IDCard(idNumber: "0002")
    let idCard3 = IDCard(idNumber: "0003")
    
    func addUser() {
        let user1 = User(value: ["id" : 1, "name" : "user1", "idCard" : idCard1])
        user1.todos.append(todo1)
        
//        let user2 = User(id: 2, name: "user2")
//        user2.todos.append(todo2)
//        user2.idCard = idCard2
//
//        let user3 = User()
//        user3.id = 3
//        user3.name = "user3"
//        user3.todos.append(objectsIn: [todo1, todo2, todo3])
//        user3.idCard = idCard3
        
        try! localRealm.write {
            localRealm.add([user1])
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
}

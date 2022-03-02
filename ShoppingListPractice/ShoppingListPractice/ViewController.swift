//
//  ViewController.swift
//  ShoppingListPractice
//
//  Created by Chae_Haram on 2022/03/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shoppingListTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @IBAction func addShoppingListButton(_ sender: UIButton) {
        let shopping = shoppingListTextField.text!
        if shopping.isEmpty {
            
        }
        
    }
    

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Shopping.ShoppingList.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

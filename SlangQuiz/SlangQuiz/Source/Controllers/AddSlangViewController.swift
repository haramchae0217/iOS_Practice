//
//  addSlangViewController.swift
//  SlangQuiz
//
//  Created by Chae_Haram on 2022/03/26.
//

import UIKit

class AddSlangViewController: UIViewController {

    // MARK: UI
    @IBOutlet weak var smallTextField: UITextField!
    @IBOutlet weak var fullTextField: UITextField!
    
    // MARK: Properties
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let rightBarbutton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(addBarButton))
        
    }

    // MARK: Action
    @objc func addBarButton() {
        
    }
}

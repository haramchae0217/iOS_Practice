//
//  MainViewController.swift
//  practiceSearchBar
//
//  Created by Chae_Haram on 2022/03/19.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchBarButtonClicked(_ sender: UIBarButtonItem) {
        guard let searchVC = storyboard?.instantiateViewController(withIdentifier: "searchVC") as? SearchViewController else { return }
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    

}

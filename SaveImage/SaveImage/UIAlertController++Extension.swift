//
//  UIAlertController++Extension.swift
//  SaveImage
//
//  Created by Chae_Haram on 2022/09/12.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "확인", style: .cancel)
        
        alert.addAction(doneButton)
        present(alert, animated: true)
    }
}

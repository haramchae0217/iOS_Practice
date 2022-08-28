//
//  ViewController.swift
//  fontName
//
//  Created by Chae_Haram on 2022/08/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "안녕하세요"
        
        for family in UIFont.familyNames {
                    print(family)
                    
                    for names in UIFont.fontNames(forFamilyName: family) {
                        print("== \(names)")
                    }
        }
    }


}

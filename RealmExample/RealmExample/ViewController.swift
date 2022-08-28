//
//  ViewController.swift
//  RealmExample
//
//  Created by Chae_Haram on 2022/08/28.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var favoriteNumberTextField: UITextField!
    @IBOutlet weak var listLabel: UILabel!
    
    let localRealm = try! Realm()
    var listArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        getPersonList()
        print("Realm Location: ",localRealm.configuration.fileURL ?? "cannot find location")
    }
    
    func getPersonList() {
        let people = localRealm.objects(Person.self)
        
        for person in people {
            listArray.append("name : \(person.name), age : \(person.age)")
        }
        listLabel.text = listArray.joined(separator: " \n")
    }

    @IBAction func dataSaveButton(_ sender: UIButton) {
        // 저장할 객체 생성
        let name = nameTextField.text!
        let age = Int(ageTextField.text!) ?? 0
        let person = Person(name: name, age: age)
        
        // db에 저장
        try! localRealm.write {
            localRealm.add(person)
        }
        
        getPersonList()
    }
    
}

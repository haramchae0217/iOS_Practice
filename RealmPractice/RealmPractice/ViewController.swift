//
//  ViewController.swift
//  RealmPractice
//
//  Created by Chae_Haram on 2022/08/29.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var dataListLabel: UILabel!
    
    var localRealm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localRealm = try! Realm()
        print("Realm저장위치=\n\(Realm.Configuration.defaultConfiguration.fileURL!)\n")
        
        readData()
    }

    func readData() {
        let list = localRealm.objects(Person.self)
        
        if list.count == 0 {
            dataListLabel.text = "DB가 비어있습니다."
        }
        
        for item in list {
            dataListLabel.text! += "이름 : \(item.name), 나이 : \(item.age) \n"
        }
        
        let filterAge = 25
        let person = localRealm.objects(Person.self).filter("age > \(filterAge)")
        print(person.count)
    }
    
    @IBAction func createDataButton(_ sender: UIButton) {
        let person = Person()
        person.name = nameTextField.text!
        person.age = Int(ageTextField.text!)!
        
        try! localRealm.write {
            localRealm.add(person)
        }
        nameTextField.text = ""
        ageTextField.text = ""
        readData()
    }
    
    @IBAction func deleteDataButton(_ sender: UIButton) {
        try! localRealm.write {
            localRealm.delete(localRealm.objects(Person.self))
        }
        readData()
    }
    
    @IBAction func updateDataButton(_ sender: UIButton) {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let localRealm = try! Realm()
                let person = localRealm.objects(Person.self).filter("age==25").first
                try! localRealm.write {
                    person!.age = 3
                }
            }
        }
        readData()
    }
    
    @IBAction func readDataButton(_ sender: UIButton) {
        readData()
    }
}


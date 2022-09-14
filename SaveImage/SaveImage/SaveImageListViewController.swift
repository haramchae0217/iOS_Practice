//
//  SaveImageListViewController.swift
//  SaveImage
//
//  Created by Chae_Haram on 2022/09/12.
//

import UIKit

class SaveImageListViewController: UIViewController {

    @IBOutlet weak var saveImageTableView: UITableView!
    
    var imageList: [(UIImage, Int)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureGetImage()
    }
    
    func configureGetImage() {
        if let imageNumber = UserDefaults.standard.string(forKey: "imageNumber"), let count = Int(imageNumber) {
            for i in 0..<count {
                if let image = ImageManager.shared.getImage(name: "\(i).jpg") {
                    imageList.append((image, i))
                }
            }
        } else {
            UserDefaults.standard.set("0", forKey: "imageNumber")
        }
    }
    
    func configureTableView() {
        saveImageTableView.delegate = self
        saveImageTableView.dataSource = self
    }
}

extension SaveImageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension SaveImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ImageTableViewCell else { return UITableViewCell() }
        let image = imageList[indexPath.row]
        cell.saveImageView.image = image.0
        cell.imageNameLabel.text = "\(image.1).jpg"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imageList.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let cell = tableView.cellForRow(at: indexPath) as? ImageTableViewCell, let name = cell.imageNameLabel.text {
                ImageManager.shared.deleteImage(name: name) { onSuccess in
                    if onSuccess {
                        self.showAlert(title: "삭제 성공", msg: "삭제성공")
                        self.imageList.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    } else {
                        self.showAlert(title: "삭제 실패", msg: "삭제실패")
                    }
                }
            }
        }
    }
}

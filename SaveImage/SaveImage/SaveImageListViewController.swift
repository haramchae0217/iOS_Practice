//
//  SaveImageListViewController.swift
//  SaveImage
//
//  Created by Chae_Haram on 2022/09/12.
//

import UIKit

class SaveImageListViewController: UIViewController {

    @IBOutlet weak var saveImageTableView: UITableView!
    
    var imageCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        if let imageNumber = UserDefaults.standard.string(forKey: "imageNumber"), let count = Int(imageNumber) {
            imageCount = count
            // for문을 통해 image들 가져옴
        } else {
            UserDefaults.standard.set("0", forKey: "imageNumber")
        }
        
    }
    
    func configureTableView() {
        saveImageTableView.delegate = self
        saveImageTableView.dataSource = self
    }
    
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "확인", style: .cancel)
        
        alert.addAction(doneButton)
        present(alert, animated: true)
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
        let image = ImageManager.shared.getImage(name: "\(indexPath.row).jpg") ?? UIImage(systemName: "pencil.circle.fill")
        cell.saveImageView.image = image
        cell.imageNameLabel.text = "\(indexPath.row).jpg"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imageCount
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "삭제") { _, _, completion in
            if let cell = tableView.cellForRow(at: indexPath) as? ImageTableViewCell, let name = cell.imageNameLabel.text {
                ImageManager.shared.deleteImage(name: name) { onSuccess in
                    if onSuccess {
                        self.showAlert(title: "삭제 성공", msg: "삭제성공")
                        tableView.reloadData()
                    } else {
                        self.showAlert(title: "삭제 실패", msg: "삭제실패")
                    }
                }
                completion(true)
            } else {
                completion(false)
            }
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

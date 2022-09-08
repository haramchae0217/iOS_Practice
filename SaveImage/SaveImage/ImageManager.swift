//
//  ImageManager.swift
//  SaveImage
//
//  Created by Chae_Haram on 2022/09/08.
//

import UIKit

/*
 싱글턴 활용 이미지 저장
 File System에 저장
 
 저장, 가져오기
 비동기 처리. @escaping
*/

class ImageManager {
    static let shared: ImageManager = ImageManager()
    
    //
    
    func saveImage(image: UIImage, pathName: String, onSuccess: @escaping (Bool) -> Void) {
        guard let data: Data = image.jpegData(compressionQuality: 0.5) ?? image.pngData() else { return }
        
        if let directory: NSURL =
            try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL {
            do {
                try data.write(to: directory.appendingPathComponent(pathName)!)
                onSuccess(true)
            } catch let error as NSError {
                print("ERROR: \(error.localizedDescription), \(error.userInfo)")
                onSuccess(false)
            }
        }
    }
    
    func getImage(name: String) -> UIImage? {
        if let directory: URL =
            try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let path: String = URL(fileURLWithPath: directory.absoluteString).appendingPathComponent(name).path
            
            let image: UIImage? = UIImage(contentsOfFile: path)
            return image
        }
        
        return nil
    }
    
    func deleteImage(name: String, onSuccess: @escaping (Bool) -> Void) {
        guard let directory =
                try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else { return }
        do {
            if let path = directory.path {
                let fileNames = try FileManager.default.contentsOfDirectory(atPath: path)
                
                for fileName in fileNames {
                    if fileName == name {
                        let filePath = "\(path)/\(fileName)"
                        try FileManager.default.removeItem(atPath: filePath)
                        onSuccess(true)
                    }
                }
            }
        } catch let error as NSError {
            print("ERROR: \(error.localizedDescription), \(error.userInfo)")
            onSuccess(false)
        }
    }
}

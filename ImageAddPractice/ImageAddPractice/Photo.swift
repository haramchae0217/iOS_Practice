//
//  Photo.swift
//  ImageAddPractice
//
//  Created by Chae_Haram on 2022/03/16.
//

import UIKit

struct Photo {
    var picture: UIImage
    var title: String
    
    static var photoData: Photo = Photo(picture: UIImage(systemName: "folder")!, title: "")
}

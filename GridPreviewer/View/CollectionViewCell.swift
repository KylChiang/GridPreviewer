//
//  CollectionViewCell.swift
//  GridPreviewer
//
//  Created by Kyl Chiang on 2018/9/30.
//  Copyright © 2018 KaiYun Chiang. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var album: Album! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        guard let album = album, let id: Int = album.id else { return }
        self.idLabel.text = String(id)
        self.titleLabel.text = album.title
        setImageView()
    }
    
    func setImageView() {
        guard let urlStr = album.thumbnailUrl else { return }
        
        let imageURL:NSURL = NSURL(string: urlStr)!
        
        DispatchQueue.global(qos: .utility).async {
            let imageData:NSData = NSData(contentsOf: imageURL as URL)!
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: imageData as Data) else {
                    return
                }
                self.imageView.image = image
            }
        }
    }
}

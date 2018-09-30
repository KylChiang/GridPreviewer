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
        
    }
}

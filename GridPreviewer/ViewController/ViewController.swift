//
//  ViewController.swift
//  GridPreviewer
//
//  Created by Kyl Chiang on 2018/9/30.
//  Copyright © 2018 KaiYun Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var serviceClient = ServiceClient()
    var albums: [Album]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceClient.fetchData { (albums) in
            self.albums = albums
        }
    }


}


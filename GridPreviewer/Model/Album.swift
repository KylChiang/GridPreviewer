//
//  Album.swift
//  GridPreviewer
//
//  Created by Kyl Chiang on 2018/9/30.
//  Copyright © 2018 KaiYun Chiang. All rights reserved.
//

import Foundation

struct Album: Codable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
    
    private struct APIKeys {
        static let albumId = "albumId"
        static let id = "id"
        static let title = "title"
        static let url = "url"
        static let thumbnailUrl = "thumbnailUrl"
    }
}

extension Album {
    init?(dictionary: [String : Any]) {
        guard
            let albumId = dictionary[APIKeys.albumId] as? Int,
            let id = dictionary[APIKeys.id] as? Int,
            let title = dictionary[APIKeys.title] as? String,
            let url = dictionary[APIKeys.url] as? String,
            let thumbnailUrl = dictionary[APIKeys.thumbnailUrl] as? String
        else { return nil }
        
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}

//
//  MEvent.swift
//  Watcher
//
//  Created by Alexandr Kurdyukov on 16/05/2019.
//  Copyright © 2019 Alexandr Kurdyukov. All rights reserved.
//

import Foundation

class MEvent: Codable {
    let id: String
    let title: String
    let description: String
    let latitude: String
    let longitude: String
    let type: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case latitude = "latitude"
        case longitude = "longitude"
        case type = "type"
    }
}

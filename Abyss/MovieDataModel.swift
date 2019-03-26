//
//  MovieDataModel.swift
//  Abyss
//
//  Created by Zane Burton on 3/20/19.
//  Copyright © 2019 Zane Burton. All rights reserved.
//

import UIKit

class MovieDataModel: Codable {
    
    var franchise: [Franchise]
}


    class Franchise: Codable {
        let franchiseName: String
        let entries: [Entry]
    }

    class Entry: Codable {
        let name: String
        let format: String
        let yearStart: String
        let yearEnd: String?
        let episodes: Int?
        let studio: String?
        let network: String?
        let imageURL: String
        let summary: String
        let description: String
        
    }

//
//  MovieDataModel.swift
//  IRDb_AMG
//
//  Created by Adam on 3/25/19.
//  Copyright © 2019 Adam Garcia. All rights reserved.
//

import UIKit

class MovieDataModel: Codable {
    var franchise: [Franchises]
}

class Franchises: Codable {
    let franchiseName: String
    var entries: [Entry]
}

class Entry: Codable {
    let name: String
    let format: String
    let yearStart: String
    let yearEnd: String?
    let episode: String?
    let network: String?
    let imageURL: String
    let description: String
    let summary: String
    var castmembers: [Cast]
}

class Cast: Codable {
    let castName: String
    let playing: String
}

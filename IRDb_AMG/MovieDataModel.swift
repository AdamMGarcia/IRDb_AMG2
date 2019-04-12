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
    let episode: int?
    let network: String?
    let imageURL: String
    let description: String
    let summary: String
    let starring: [Starring]
}

class Starring: Codable {
    let name: String
    let playing: String
}


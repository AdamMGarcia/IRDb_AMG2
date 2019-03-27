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

class Franchises: Codable{
    var FranchiseName: String
    var entry = [Entries]
}
    
class Entries: Codable{
        var string: name
        var string: year
        var string: Format
        var string: network
        var string: episodes
        var string: castList
            
        }

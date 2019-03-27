//
//  MovieDataController.swift
//  IRDb_AMG
//
//  Created by Adam on 3/25/19.
//  Copyright © 2019 Adam Garcia. All rights reserved.
//

import UIKit

class MovieDataController: NSObject, Codable {

    class MoiveDetailController: NSObject {
        
        var detailViewController: DetailViewController? = nil
        
        //JSON Parsing
        let url = "https://restcountries.eu/rest/v2/all"
        
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
        
        do {
        var decoder =  JSONDecoder().decode([franchise!].self, from: data!)
        
        for franchise in franchises {
        print(franchise.name)
        }
        } catch {
        print("An error occured")
        }
        // call completion handler to go back to main thread
        
        }.resume()
}

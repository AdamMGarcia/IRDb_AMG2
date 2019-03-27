//
//  MovieDataController.swift
//  IRDb_AMG
//
//  Created by Adam on 3/25/19.
//  Copyright © 2019 Adam Garcia. All rights reserved.
//

import UIKit

class MovieDataController: NSObject {
        
        //JSON Parsing
        let url = "https://restcountries.eu/rest/v2/all"
        
        var dataModel: Any?
    
    // ?
    func getRebootData(completion: @escaping (_ dataModel: MovieDataModel) -> ()) {
        
        let urlObj = URL(string: url)
        
        // ?
        let dataTask = URLSession.shared.dataTask(with: urlObj!) {
            (data, response, error) in
        
            guard let data = data else {
                return
            }
            
                do {
                    
                    // ?
                    let decoder =  JSONDecoder()
                    let mediaData = try decoder.decode(MovieDataModel.self, from: data)
                    
                    
                    self.dataModel = mediaData
                    
        
                    } catch let err {
                    print("An error occured", err)
                }
            
                    // ?
                    DispatchQueue.main.async {
                        completion(self.dataModel as! MovieDataModel)
        }
        // call completion handler to go back to main thread
        
        }
        dataTask.resume()
   }
}

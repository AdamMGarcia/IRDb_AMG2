//
//  DetailViewController.swift
//  IRDb_AMG
//
//  Created by Adam Garcia on 3/18/19.
//  Copyright © 2019 Adam Garcia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var network: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var castButton: UIButton!
    
    @IBOutlet weak var summary: UILabel!
    
 
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let episodes = detail.episodes{
                episode.text = "\(episodes)"
                
            }
            
            movieName.text = detail.name
            year.text = detail.yearStart
            format.text = detail.format
            network.text = detail.studio
            detailDescription.text = detail.description
            summary.text = detail.summary
            
            let url = URL(string: detail.imageURL)
            let data = try! Data(contentsOf: url!)
            let image = UIImage(data: data)
            picture.image = image
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: Entry? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}


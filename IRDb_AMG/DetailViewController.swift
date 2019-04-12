//
//  DetailViewController.swift
//  IRDb_AMG
//
//  Created by Adam Garcia on 3/18/19.
//  Copyright © 2019 Adam Garcia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var UIname: UILabel!
    @IBOutlet weak var UIformat: UILabel!
    @IBOutlet weak var UIyear: UILabel!
    @IBOutlet weak var UIimage: UIImageView!
    @IBOutlet weak var UInetwork: UILabel!
    @IBOutlet weak var UIepisode: UILabel!
    @IBOutlet weak var UIcastButton: UIButton!
    
    @IBOutlet weak var UIdescription: UILabel!
    @IBOutlet weak var UIsummary: UILabel!
    
    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let episodes = detail.episode{
                UIepisode.text = "\(episodes)"
                
            }
            
            UIname.text = detail.name
            UIyear.text = detail.yearStart
            UIformat.text = detail.format
            UInetwork.text = detail.network
            UIdescription.text = detail.description
            UIsummary.text = detail.summary
            
            let url = URL(string: detail.imageURL)
            let data = try! Data(contentsOf: url!)
            let image = UIImage(data: data)
            UIimage.image = image
            
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


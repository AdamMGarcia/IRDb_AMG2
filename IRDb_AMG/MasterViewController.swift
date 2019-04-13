//
//  MasterViewController.swift
//  IRDb_AMG
//
//  Created by Adam Garcia on 3/18/19.
//  Copyright © 2019 Adam Garcia. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController?
    let dataController = MovieDataController()
    var rebootDataModel: MovieDataModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var objects = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let titleImage = UIImage(named: "irdblogo")
        let titleImageView = UIImageView(image: titleImage)
        navigationItem.titleView = titleImageView
        
        dataController.getRebootData(completion: {dataModel in
            self.rebootDataModel = dataModel
        })
        
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = rebootDataModel!.franchise[indexPath.section].entries[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return (rebootDataModel?.franchise.count) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (rebootDataModel?.franchise[section].franchiseName) ?? "No data yet"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (rebootDataModel?.franchise[section].entries.count) ?? 0
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let mediaName = (rebootDataModel?.franchise[indexPath.section].entries[indexPath.row].name)!
        cell.textLabel!.text = mediaName
        
        
        let mediaYear = (rebootDataModel?.franchise[indexPath.section].entries[indexPath.row].yearStart)
        cell.detailTextLabel!.text = mediaYear
        
        return cell
    }
}


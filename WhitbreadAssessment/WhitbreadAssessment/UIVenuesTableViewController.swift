//
//  UIVenuesTableViewController.swift
//  WhitbreadAssessment
//
//  Created by Cyrielle Gandon on 09/03/2016.
//  Copyright © 2016 JerOdd. All rights reserved.
//

import UIKit

class UIVenuesTableViewController: UITableViewController, UISearchBarDelegate, BOVenuesManagerDelegate
{

    @IBOutlet weak var placeSearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        BOVenuesManager.sharedInstance.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return BOVenuesManager.sharedInstance.venues.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("venuesCellIdentifier", forIndexPath: indexPath)

        cell.textLabel!.text = BOVenuesManager.sharedInstance.venues[indexPath.row].name

        return cell
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        BOVenuesManager.sharedInstance.searchVenuesForPlace(searchBar.text!)
    }
    
    func didReceiveVenues()
    {
        self.tableView.reloadData()
    }
}

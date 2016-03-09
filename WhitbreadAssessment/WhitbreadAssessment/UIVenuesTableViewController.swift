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
    
    // MARK: - View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        BOVenuesManager.sharedInstance.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return BOVenuesManager.sharedInstance.venues.count // number of venues
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("venuesCellIdentifier", forIndexPath: indexPath)

        cell.textLabel!.text = BOVenuesManager.sharedInstance.venues[indexPath.row].name

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let appDelegate : AppDelegate = (UIApplication.sharedApplication().delegate as? AppDelegate)!
        splitViewController?.showDetailViewController(appDelegate.venuesDetailsViewController!, sender: nil)
    }

    // MARK: - Search bar delegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        BOVenuesManager.sharedInstance.searchVenuesForPlace(searchBar.text!) // Search all the venues for the given place
    }
    
    // MARK: - BOVenuesManager delegate
    
    /**
     * Called when we have received new venues
     */
    func didReceiveVenues()
    {
        self.tableView.reloadData() // We refresh the display
    }
}

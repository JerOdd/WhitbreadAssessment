//
//  BOVenuesManager.swift
//  WhitbreadAssessment
//
//  Created by Cyrielle Gandon on 09/03/2016.
//  Copyright © 2016 JerOdd. All rights reserved.
//

import Foundation

protocol BOVenuesManagerDelegate: class
{
    /**
     * Called when we have received new venues
     */
    func didReceiveVenues()
}

class BOVenuesManager: NSObject, DAOVenuesRequestDelegate
{
    static let sharedInstance = BOVenuesManager() // The manager is a singleton
    
    var delegate : BOVenuesManagerDelegate?
    var venues : Array<Venue> = Array<Venue>() // Array of venues
    
    /**
     * Search the venues for a given place
     */
    func searchVenuesForPlace(place : String)
    {
        // Creation of new request
        let venuesRequest = DAOVenuesRequest()
        venuesRequest.delegate = self
        
        // Send a request to download the venues for a given place
        venuesRequest.downloadVenueForPlace(place)
    }
    
    /**
     * Called when we have received new venues for a place
     * - Parameter venues: the received venues
     * - Parameter place: the searched place
     */
    func didReceiveVenues(venues: Array<Venue>, forPlace place: String)
    {
        self.venues = venues
        
        // Notify the delegate that we have received new values
        self.delegate?.didReceiveVenues()
    }
    
    /**
     * Called when we failed to receive venues for a place
     * - Parameter place: the searched place
     */
    func didFailToReceiveVenuesforPlace(place: String)
    {
        
    }
}

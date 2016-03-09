//
//  BOVenuesManager.swift
//  WhitbreadAssessment
//
//  Created by Cyrielle Gandon on 09/03/2016.
//  Copyright © 2016 JerOdd. All rights reserved.
//

import Foundation

class BOVenuesManager: NSObject, DAOVenuesRequestDelegate
{
    static let sharedInstance = BOVenuesManager() // The manager is a singleton
    
    func searchVenuesForPlace(place : String)
    {
        let venuesRequest = DAOVenuesRequest()
        venuesRequest.delegate = self
        venuesRequest.downloadVenueForPlace(place)
    }
    
    func didReceiveVenues(venues: Array<Venue>, forPlace place: String)
    {
        
    }
    
    func didFailToReceiveVenuesforPlace(place: String)
    {
        
    }
}

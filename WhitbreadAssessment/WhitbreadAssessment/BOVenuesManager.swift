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
    func didReceiveVenues()
}

class BOVenuesManager: NSObject, DAOVenuesRequestDelegate
{
    static let sharedInstance = BOVenuesManager() // The manager is a singleton
    
    var delegate : BOVenuesManagerDelegate?
    var venues : Array<Venue> = Array<Venue>()
    
    func searchVenuesForPlace(place : String)
    {
        let venuesRequest = DAOVenuesRequest()
        venuesRequest.delegate = self
        venuesRequest.downloadVenueForPlace(place)
    }
    
    func didReceiveVenues(venues: Array<Venue>, forPlace place: String)
    {
        self.venues = venues
        self.delegate?.didReceiveVenues()
    }
    
    func didFailToReceiveVenuesforPlace(place: String)
    {
        
    }
}

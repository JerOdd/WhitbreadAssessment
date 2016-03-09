//
//  DAOVenuesRequest.swift
//  WhitbreadAssessment
//
//  Created by Cyrielle Gandon on 09/03/2016.
//  Copyright © 2016 JerOdd. All rights reserved.
//

import UIKit

protocol DAOVenuesRequestDelegate: class
{
    func didReceiveVenues(venues : Array<Venue>, forPlace place : String)
    func didFailToReceiveVenuesforPlace(place : String)
}

class DAOVenuesRequest: NSObject
{
    weak var delegate: DAOVenuesRequestDelegate?
    
    func downloadVenueForPlace(place: String)
    {
        let url : NSURL = NSURL(string: "https://api.foursquare.com/v2/venues/search?client_id=3Q3V0L233AU5DQOPYNNUZOZZCDARM3CNLIP5DPJ5AMOAP3EO&client_secret=RWFVX35UQWCMOEPIVGFKK3DPQHFDQWJC4K35Q4MN2RZGJEYU&v=20130815&near=\(place)")! // URL of the request
        let session : NSURLSession = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        let task = session.dataTaskWithRequest(request)
            {
                (let data : NSData?, let response : NSURLResponse?, let error: NSError?) -> Void in
                if (error != nil)
                {
                    print(error)
                    
                    // We need to perform this code on the main thread
                    dispatch_async(dispatch_get_main_queue(),
                        {
                            self.delegate?.didFailToReceiveVenuesforPlace(place) // Haven't received any information
                    })
                }
                else
                {
                    do
                    {
                        // Parse the json into dictionary
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                        
                        // Get the venues dictionary
                        let responseDictionary = json["response"] as! Dictionary<String,AnyObject>
                        let venuesDictionary = responseDictionary["venues"]
                        
                        // Creation of the list of venues
                        var venues : Array<Venue> = Array<Venue>()
                        
                        for var i = 0; i < venuesDictionary?.count; i++
                        {
                            let venueDictionary = venuesDictionary?.objectAtIndex(i) as! Dictionary<String,AnyObject>
                            let venue = Venue.init(withDictionary: venueDictionary) // Creation of venue
                            venues.append(venue)
                        }
                        
                        // We need to perform this code on the main thread
                        dispatch_async(dispatch_get_main_queue(),
                            {
                                // Notify the delegate with the venues and the place
                                self.delegate?.didReceiveVenues(venues, forPlace: place)
                        })
                    }
                    catch (let exception as NSError)
                    {
                        print(exception)
                        
                        // We need to perform this code on the main thread
                        dispatch_async(dispatch_get_main_queue(),
                            {
                                self.delegate?.didFailToReceiveVenuesforPlace(place) // Haven't received any information
                        })
                    }
                }
        }
        task.resume()
    }
}

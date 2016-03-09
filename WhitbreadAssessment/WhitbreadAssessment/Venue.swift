//
//  Venue.swift
//  WhitbreadAssessment
//
//  Created by Cyrielle Gandon on 09/03/2016.
//  Copyright © 2016 JerOdd. All rights reserved.
//

import Foundation

class Venue: NSObject
{
    var id : String?
    var name : String?
    
    init(withDictionary dictionary : Dictionary<String,AnyObject>)
    {
        super.init()
        self.name = dictionary["name"] as? String
        self.id = dictionary["id"] as? String
    }
}


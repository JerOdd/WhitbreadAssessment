//
//  UIVenuesDetailsViewController.swift
//  WhitbreadAssessment
//
//  Created by Cyrielle Gandon on 09/03/2016.
//  Copyright © 2016 JerOdd. All rights reserved.
//

import UIKit

class UIVenuesDetailsViewController: UIViewController
{
    
    @IBOutlet weak var idLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /**
     * Change the content of the id value with the new one
     * - Parameter venue : The new venue
     */
    func changeIdWithVenue(venue : Venue)
    {
        self.idLabel.text = venue.id
    }
}

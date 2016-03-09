//
//  UIVenuesDetailsViewController.swift
//  WhitbreadAssessment
//
//  Created by Cyrielle Gandon on 09/03/2016.
//  Copyright © 2016 JerOdd. All rights reserved.
//

import UIKit

class UIVenuesDetailsViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeIdWithVenue(venue : Venue)
    {
        self.idLabel.text = venue.id
    }
}

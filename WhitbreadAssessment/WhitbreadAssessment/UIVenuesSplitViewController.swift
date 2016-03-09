//
//  UIVenuesSplitViewController.swift
//  WhitbreadAssessment
//
//  Created by Cyrielle Gandon on 09/03/2016.
//  Copyright © 2016 JerOdd. All rights reserved.
//

import UIKit

class UIVenuesSplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.delegate = self
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool
    {
        // Always display the master table view
        return true
    }

}

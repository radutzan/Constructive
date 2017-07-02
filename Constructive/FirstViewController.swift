//
//  FirstViewController.swift
//  Constructive
//
//  Created by Radu Dutzan on 5/4/17.
//  Copyright © 2017 Radu Dutzan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, Themable {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sample usage of AnimationDuration
        UIView.animate(withDuration: 0.28 * AnimationDuration.speedMultiplier, delay: 0.32 * AnimationDuration.speedMultiplier, options: [], animations: {
            
        }, completion: nil)
    }
    
    func themeDidChange() {
        // Perform your theme changes here
    }

}


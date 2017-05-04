//
//  FirstViewController.swift
//  Constructive
//
//  Created by Radu Dutzan on 5/4/17.
//  Copyright © 2017 Radu Dutzan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 0.28 * AnimationDuration.speedMultiplier, delay: 0.32 * AnimationDuration.speedMultiplier, options: [], animations: {
            
        }, completion: nil)
    }

}


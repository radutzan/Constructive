//
//  AnimationDuration.swift
//  Constructive
//
//  Created by Radu Dutzan on 5/4/17.
//  Copyright © 2017 Radu Dutzan. All rights reserved.
//

import UIKit

struct AnimationDuration {
    static var speedMultiplier: TimeInterval {
        return UserDefaults.standard.double(forKey: "Animation speed multiplier")
    }
    static var short: TimeInterval {
        return 0.24 * speedMultiplier
    }
    static var medium: TimeInterval {
        return 0.32 * speedMultiplier
    }
    static var long: TimeInterval {
        return 0.42 * speedMultiplier
    }
    static var longer: TimeInterval {
        return 0.64 * speedMultiplier
    }
}

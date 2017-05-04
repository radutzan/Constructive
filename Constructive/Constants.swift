//
//  Constants.swift
//  Constructive
//
//  Created by Radu Dutzan on 5/4/17.
//  Copyright © 2017 Radu Dutzan. All rights reserved.
//

import UIKit

struct Constants {
    static var isDebugBuild: Bool {
        return false // TODO: make this a real check
    }
    static var avatarSizeLarge: CGSize {
        let deviceWidth = UIScreen.main.fixedCoordinateSpace.bounds.width
        let avatarSquareSide = floor(deviceWidth / 3)
        return CGSize(width: avatarSquareSide, height: avatarSquareSide)
    }
    static let placeholderImage = UIImage(named: "placeholder")
    static let secondaryTextColor = UIColor(white: 0, alpha: 0.5)
    static let fontSizeTitleMedium: CGFloat = 14
    
    struct CornerRadius {
        static let avatarSmall: CGFloat = 2
        static let avatarMedium: CGFloat = 3
        static let avatarLarge: CGFloat = 4
        static let buttonContainer: CGFloat = 6
    }
}

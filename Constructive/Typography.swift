//
//  TypeStyle.swift
//  Constructive
//
//  Created by Radu Dutzan on 5/4/17.
//  Copyright © 2017 Radu Dutzan. All rights reserved.
//

import UIKit

struct TypeStyle {
    enum TextTransform {
        case none, lowercase, uppercase
    }
    var size: CGFloat
    var weight: CGFloat
    var letterSpacing: CGFloat?
    var textTransform: TextTransform?
    
    init(size: CGFloat, weight: CGFloat, letterSpacing: CGFloat? = nil, textTransform: TextTransform? = nil) {
        self.size = size
        self.weight = weight
        self.letterSpacing = letterSpacing
        self.textTransform = textTransform
    }
    
    static let display = TypeStyle(size: 18, weight: UIFontWeightLight)
    static let sectionHeader = TypeStyle(size: 13, weight: UIFontWeightSemibold, letterSpacing: 2, textTransform: .uppercase)   
    static let titleCompact = TypeStyle(size: 13, weight: UIFontWeightMedium)
    static let titleMedium = TypeStyle(size: 14, weight: UIFontWeightMedium)
    static let titleLarge = TypeStyle(size: 15, weight: UIFontWeightMedium)
    static let subtitle = TypeStyle(size: 11, weight: UIFontWeightSemibold)
}

extension UIFont {
    static var display: UIFont {
        return UIFont.systemFont(ofSize: TypeStyle.display.size,
                                 weight: TypeStyle.display.weight)
    }
    static var titleCompact: UIFont {
        return UIFont.systemFont(ofSize: TypeStyle.titleCompact.size,
                                 weight: TypeStyle.titleCompact.weight)
    }
    static var titleMedium: UIFont {
        return UIFont.systemFont(ofSize: TypeStyle.titleMedium.size,
                                 weight: TypeStyle.titleMedium.weight)
    }
    static var titleLarge: UIFont {
        return UIFont.systemFont(ofSize: TypeStyle.titleLarge.size,
                                 weight: TypeStyle.titleLarge.weight)
    }
    static var subtitle: UIFont {
        return UIFont.systemFont(ofSize: TypeStyle.subtitle.size,
                                 weight: TypeStyle.subtitle.weight)
    }
}

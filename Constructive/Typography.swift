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
    
    static var sizeMultiplier: CGFloat {
        let normalBodySize: CGFloat = 17
        let currentBodySize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).pointSize
        let multiplier = currentBodySize / normalBodySize
        return multiplier
    }
    
    static func proportionalTypeSize(for originalSize: CGFloat) -> CGFloat {
        let result = round(originalSize * sizeMultiplier)
        return result
    }
    
    static func proportionalContainerSize(for originalSize: CGFloat) -> CGFloat {
        let multiplier = max(sizeMultiplier, 1)
        let result = round(originalSize * multiplier)
        return result
    }
    
    func fontObject() -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}

func attributedString(from string: String, style: TypeStyle, textColor: UIColor? = nil) -> NSMutableAttributedString {
    var string = string
    switch style.textTransform {
    case .some(.lowercase):
        string = string.lowercased()
    case .some(.uppercase):
        string = string.uppercased()
    default:
        break
    }
    
    let attributedString = NSMutableAttributedString(string: string, attributes: [
        NSFontAttributeName: UIFont.systemFont(ofSize: style.size, weight: style.weight),
        NSKernAttributeName: style.letterSpacing ?? 0])
    
    if let color = textColor {
        attributedString.addAttributes([
            NSForegroundColorAttributeName: color],
                                       range: NSMakeRange(0, string.characters.count))
    }
    
    return attributedString
}

// Sample TypeStyle definitions
extension TypeStyle {
    static let display = TypeStyle(size: 18, weight: UIFontWeightLight)
    static let sectionHeader = TypeStyle(size: 13, weight: UIFontWeightSemibold, letterSpacing: 2, textTransform: .uppercase)
    static let titleCompact = TypeStyle(size: 13, weight: UIFontWeightMedium)
    static let titleMedium = TypeStyle(size: 14, weight: UIFontWeightMedium)
    static let titleLarge = TypeStyle(size: 15, weight: UIFontWeightMedium)
    static let subtitle = TypeStyle(size: 11, weight: UIFontWeightSemibold)
}

extension UIFont {
    static var display: UIFont { return TypeStyle.display.fontObject() }
    static var titleCompact: UIFont { return TypeStyle.titleCompact.fontObject() }
    static var titleMedium: UIFont { return TypeStyle.titleMedium.fontObject() }
    static var titleLarge: UIFont { return TypeStyle.titleLarge.fontObject() }
    static var subtitle: UIFont { return TypeStyle.subtitle.fontObject() }
}

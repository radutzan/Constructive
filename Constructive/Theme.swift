//
//  Theme.swift
//  Constructive
//
//  Created by Radu Dutzan on 5/4/17.
//  Copyright © 2017 Radu Dutzan. All rights reserved.
//

import UIKit

protocol Themable: class {
    func themeDidChange()
}

struct Theme {
    // MARK: - Keys and notifications
    struct Keys {
        static let tintColor = "Tint color"
        static let darkTheme = "Current theme is dark"
    }
    static let themeChangedNotificationName = Notification.Name(rawValue: "Theme changed")
    
    // MARK: - Active theme
    static var active: Theme = BuiltIn.standard {
        didSet {
            guard oldValue.style != active.style else { return }
            
            UserDefaults.standard.set(active.style == .dark, forKey: Keys.darkTheme)
            
            let notification = Notification(name: Theme.themeChangedNotificationName, object: nil)
            NotificationQueue.default.enqueue(notification, postingStyle: .asap, coalesceMask: .onName, forModes: nil)
        }
    }
    
    // MARK: - Built-in themes
    struct BuiltIn {
        static var standard: Theme {
            return Theme()
        }
        static var dark: Theme {
            var darkTheme = Theme()
            darkTheme.style = .dark
            darkTheme.colors.primary = UIColor.black
            darkTheme.colors.contrast = UIColor.white
            darkTheme.colors.tableViewSeparator = UIColor(white: 1, alpha: 0.08)
            darkTheme.colors.contentBackground = UIColor(white: 0.06, alpha: 1)
            darkTheme.colors.text.primary = UIColor(white: 1, alpha: 0.88)
            darkTheme.colors.text.secondary = UIColor(white: 1, alpha: 0.4)
            darkTheme.colors.text.sectionHeader = UIColor(white: 1, alpha: 0.6)
            return darkTheme
        }
    }
    
    // MARK: - Dark or light style
    enum Style {
        case light, dark
    }
    var style: Style = .light {
        didSet {
            switch style {
            case .light:
                colors.primary = UIColor.white
                colors.contrast = UIColor.black
            case .dark:
                colors.primary = UIColor.black
                colors.contrast = UIColor.white
            }
        }
    }
    var barStyle: UIBarStyle {
        return style == .light ? .default : .black
    }
    var statusBarStyle: UIStatusBarStyle {
        return barStyle == .black ? .lightContent : .default
    }
    
    // MARK: - Colors
    struct Color {
        var primary = UIColor.white
        var contrast = UIColor.black
        
        var tableViewSeparator = UIColor(white: 0, alpha: 0.09)
        var contentBackground = UIColor(white: 0.975, alpha: 1)
        var selectionRing: UIColor {
            return tint.withAlphaComponent(0.12)
        }
        
        struct Text {
            var primary = UIColor(white: 0, alpha: 0.66)
            var secondary = UIColor(white: 0, alpha: 0.3)
            var sectionHeader = UIColor(white: 0, alpha: 0.45)
        }
        var text = Text()
        
        var tint: UIColor {
            get {
                if let colorData = UserDefaults.standard.data(forKey: Keys.tintColor), let color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor {
                    return color
                } else {
                    return .blue // your default here
                }
            }
            set {
                UIApplication.shared.keyWindow?.tintColor = newValue
                
                let colorData = NSKeyedArchiver.archivedData(withRootObject: newValue)
                UserDefaults.standard.set(colorData, forKey: Keys.tintColor)
                
                let notification = Notification(name: Theme.themeChangedNotificationName, object: nil)
                NotificationQueue.default.enqueue(notification, postingStyle: .asap, coalesceMask: .onName, forModes: nil)
            }
        }
    }
    var colors = Color()
}

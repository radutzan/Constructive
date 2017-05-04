//
//  AppDelegate.swift
//  Constructive
//
//  Created by Radu Dutzan on 5/4/17.
//  Copyright © 2017 Radu Dutzan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        NotificationCenter.default.addObserver(self,
           selector: #selector(themeChangedNotification),
           name: Theme.themeChangedNotificationName,
           object: nil)
        
        return true
    }
    
    // MARK: - Theme changing
    @objc private func themeChangedNotification() {
        UIApplication.shared.statusBarStyle = Theme.active.statusBarStyle
        
        guard let rootVC = window?.rootViewController else { return }
        updateTheme(controller: rootVC)
        updateTheme(view: rootVC.view)
    }
    
    private func updateTheme(view: UIView) {
        if let themableView = view as? Themable {
            UIView.animate(withDuration: AnimationDuration.short, animations: {
                themableView.themeDidChange()
            })
        }
        
        for subview in view.subviews {
            updateTheme(view: subview)
        }
    }
    
    private func updateTheme(controller: UIViewController) {
        if let themableVC = controller as? Themable {
            UIView.animate(withDuration: AnimationDuration.short, animations: {
                themableVC.themeDidChange()
            })
        }
        
        for child in controller.childViewControllers {
            updateTheme(controller: child)
        }
    }
    
}


//
//  AppDelegate.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 5/7/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UINavigationController(rootViewController: TypePokemonViewController())
//        vc.navigationBar.isHidden = true
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}


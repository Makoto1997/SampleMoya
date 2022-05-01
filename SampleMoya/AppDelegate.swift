//
//  AppDelegate.swift
//  SampleMoya
//
//  Created by Makoto on 2022/05/01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Router.shared.showRoot(window: UIWindow(frame: UIScreen.main.bounds))
        return true
    }
}


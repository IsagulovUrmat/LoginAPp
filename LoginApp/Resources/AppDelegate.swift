//
//  AppDelegate.swift
//  LoginApp
//
//  Created by Isagulov urmat on 24/1/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        loginApp()
        
        window.makeKeyAndVisible()
        
        
        return true
    }

    func loginApp() {

        self.window?.rootViewController = navController(vc: LoginViewController())
    }
    
    func mainApp() {
        
        
        self.window?.rootViewController = navController(vc: MainViewController())
        
    }
    
    func navController(vc: UIViewController) -> UINavigationController {
        
        let viewController = UINavigationController(rootViewController: vc)
        viewController.navigationBar.isHidden = true
        
        return viewController
    }

}


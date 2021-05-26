//
//  AppDelegate.swift
//  DrawerDemo
//
//  Created by Mihai Petrenco on 5/25/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = buildDrawerViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func buildDrawerViewController() -> UIViewController {
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
    
        return DrawerViewController(parentController: firstViewController,
                                    draggableController: secondViewController)
    }

}


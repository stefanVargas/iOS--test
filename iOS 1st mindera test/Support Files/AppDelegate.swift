//
//  AppDelegate.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 26/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var presenter: Presenter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        self.presenter = Presenter(window: self.window ?? UIWindow())
        self.presenter?.start()
        return true
    }

}


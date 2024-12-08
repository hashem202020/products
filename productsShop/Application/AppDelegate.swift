//
//  AppDelegate.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var appCoordinator: AppCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let appDependencyContainer = AppDependencyContainer()
        let navigationController = UINavigationController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(navigationController: navigationController,
                                        productsListDependencyContainer: appDependencyContainer.productsListDependencyContainer)
        appCoordinator?.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

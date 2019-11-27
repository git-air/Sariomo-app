//
//  AppDelegate.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/10/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        changeNavigationBarColor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        
        if(launchedBefore == true) {
            UserDefaults.standard.set(false, forKey: "launchBefore")
        } else {
            UserDefaults.standard.set(true, forKey: "launchBefore")
            
            let registrationVC = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = registrationVC
        }
        
        return true
    }
    
    func changeNavigationBarColor() {
        // Navigation Bar の文字色の変更
        UINavigationBar.appearance().tintColor = MyColor.tomato
        // Navigation Bar のタイトルの文字色の変更
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: MyColor.tomato]
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}


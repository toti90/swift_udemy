//
//  AppDelegate.swift
//  Todoey
//
//  Created by Tamás Tóth on 2019. 05. 08..
//  Copyright © 2019. Tamás Tóth. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        do {
            _ = try Realm()
        } catch {
            print("Error installing new realm")
        }
        
        return true
    }
}


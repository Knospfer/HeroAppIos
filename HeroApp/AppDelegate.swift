//
//  AppDelegate.swift
//  HeroApp
//
//  Created by Mattia Berrueta on 23/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    //questa  è la prima funziona che chiama ios quando lancia l'app -> un pò il nostro main
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //ritorno true perchè l'app può partire, ma se avessi qualche prob di configuarzione potrei tornare false e chiudere tutto
        return true
    }

    //MARK: UISceneSession Lifecycle
    
    //con queste funzioni posso switchare ad apple car o ricreare una view quando riavvio l'app in base ad un determitato stato

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


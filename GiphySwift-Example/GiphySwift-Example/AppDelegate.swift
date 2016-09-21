//
//  AppDelegate.swift
//  GiphySwift-Example
//
//  Created by Matias Seijas on 9/14/16.
//  Copyright © 2016 Matias Seijas. All rights reserved.
//

import UIKit
import GiphySwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Giphy.configure(with: .public)
        
        Giphy.request(.trending) { (requestResult) in
            switch requestResult {
            case .success(let result, let properties):
                print("** RESULT **")
                print(result)
                //if let first = result.first {
                    let first = result.first
                    let importDate = first?.importDate
                    print("** IMPORT DATE **")
                
                    print (importDate?.description(with: Locale.current))
                    print("***")
                //}
                
                print("** PROPERTIES **")
                print(properties)
            case .error(let error): print("^ ERROR: \(error)")
            }
        }
        
        return true
    }

}


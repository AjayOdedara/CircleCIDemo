//
//  AppDelegate.swift
//  HomeWork
//
//  Created by Ajay Odedra on 03/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let pri = Prime.calc(32)
        print(pri)
        return true
    }

}

class Prime {
    static var val: Int = 0
    static var res: [Int] = []
    static var start: Int = 0
    
    static func calc(_ num: Int) -> [Int] {
        val = num
        res = [Int]()
        start = 2

        //Removed while loop, and Factors result are same
        for incre in stride(from: start, to: val, by: 1){
            
            // This loop is also work // for start in 2 ..< val {
            while (val % incre) == 0 {
                res.append(incre)
                val /= incre
            }
            // Removed incremental function as it's already in loop
        }
        return res
    }
}


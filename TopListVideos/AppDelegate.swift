//
//  AppDelegate.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 9-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import UIKit

//globalVars

var reachGlObj = Reachability?()

var reachStatusGlObj = ""



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  var internetCheckGlObj = Reachability?()
  
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    
    
//    NSURLCache.setSharedURLCache(NSURLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil))
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.reachChanged(_:)), name: kReachabilityChangedNotification, object: nil)
    
    internetCheckGlObj = Reachability.reachabilityForInternetConnection()
    internetCheckGlObj?.startNotifier()
    statusChange(internetCheckGlObj!)
    
    
    return true
  }

  
  //customFuncs
  
  func reachChanged(notify: NSNotification){
    
    reachGlObj = notify.object as? Reachability
    statusChange(reachGlObj!)
    
  }
  
  func statusChange(currentReachStaus: Reachability)  {
    
    let netStatus : NetworkStatus = currentReachStaus.currentReachabilityStatus()
    
    switch netStatus.rawValue {
    case NotReachable.rawValue : reachStatusGlObj = NOACCESS
    case ReachableViaWiFi.rawValue : reachStatusGlObj = WIFI
    case ReachableViaWWAN.rawValue : reachStatusGlObj = WANN
    default: return
    }
    
    NSNotificationCenter.defaultCenter().postNotificationName("ReachStatusChanged", object: nil)
    
    
  }
  
  
  
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    NSNotificationCenter.defaultCenter().removeObserver(self, name: kReachabilityChangedNotification, object: nil)
    
    
  }


}


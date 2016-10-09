//
//  APIManager.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 9-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import Foundation

class APIManager {
  
  //func loadData(urlStr: String, completion: (result: String)) -> Void
  func loadData(urlStr: String, completion: (resultFrmCompletion: String) -> Void) {
    
    
    let configObj = NSURLSessionConfiguration.ephemeralSessionConfiguration()
    
    
    let sessionObj = NSURLSession(configuration: configObj)
    
    
    //create a session
//    let sessionObj = NSURLSession.sharedSession()
    let urlObj = NSURL(string: urlStr)
    
    let taskObj = sessionObj.dataTaskWithURL(urlObj!) { (dataBlock, responseBlock, errorBlock) in
      
      
      dispatch_async(dispatch_get_main_queue()) {
        
        // check the error
        
        if errorBlock != nil{
          
          completion(resultFrmCompletion: (errorBlock?.localizedDescription)!)
          
        }else{
          
          completion(resultFrmCompletion: "Nsurl Success")
          print(dataBlock!)
        }
        
    
      }
      
      
      
    }
    
    
    taskObj.resume()
    
    
  //loadData ends
  }
  
  
  
  //APIManager ends
}
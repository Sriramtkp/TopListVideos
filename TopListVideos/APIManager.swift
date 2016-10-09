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
          
//         . completion(resultFrmCompletion: "Nsurl Success")
//          print(dataBlock!)
          
          do{
            
            if let jsonObj = try NSJSONSerialization.JSONObjectWithData(dataBlock!, options: .AllowFragments) as? [String: AnyObject]{
              
              print(jsonObj)
              
              //priority
              
              let priority = DISPATCH_QUEUE_PRIORITY_HIGH
              dispatch_async(dispatch_get_global_queue(priority, 0)) {
                
                dispatch_async(dispatch_get_main_queue()){
                  
                  completion(resultFrmCompletion: "JSON Success")
                }
                
              }
              
              
              
              
            }
            
            
          }catch{
            dispatch_async(dispatch_get_main_queue()){
              
              completion(resultFrmCompletion: "JSON Error")
            }
            
          }
          
         //else ends
        }
    
      }
      
        }
    
    taskObj.resume()
    
    
  //loadData ends
  }
  
  
  
  //APIManager ends
}
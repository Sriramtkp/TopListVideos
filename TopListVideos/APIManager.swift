//
//  APIManager.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 9-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import Foundation

class APIManager {
  
  //func loadData(urlStr: String, completion: (resultFrmCompletion: String)) -> Void
  func loadData(urlStr: String, completion: [VideosClass] -> Void) {
    
    
    let configObj = NSURLSessionConfiguration.ephemeralSessionConfiguration()
    
    
    let sessionObj = NSURLSession(configuration: configObj)
    
    
    //create a session
//    let sessionObj = NSURLSession.sharedSession()
    let urlObj = NSURL(string: urlStr)
    
    let taskObj = sessionObj.dataTaskWithURL(urlObj!) { (dataBlock, responseBlock, errorBlock) in
      
      
      dispatch_async(dispatch_get_main_queue()) {
        
        // check the error
        
        if errorBlock != nil{
          
//          completion(resultFrmCompletion: (errorBlock?.localizedDescription)!)
          print( errorBlock?.localizedDescription)
          
        }else{
          
//         . completion(resultFrmCompletion: "Nsurl Success")
//          print(dataBlock!)
          
//          do{
//            
////            if let jsonObj = try NSJSONSerialization.JSONObjectWithData(dataBlock!, options: .AllowFragments) as? [String: AnyObject] -- is changed as JSONDictionary
//              if let jsonObj = try NSJSONSerialization.JSONObjectWithData(dataBlock!, options: .AllowFragments) as? JSONDictionary
//                
//                
//            {
//
//              print(jsonObj)
//              
//              //priority
//              
//              let priority = DISPATCH_QUEUE_PRIORITY_HIGH
//              dispatch_async(dispatch_get_global_queue(priority, 0)) {
//                
//                dispatch_async(dispatch_get_main_queue()){
//                  
//                  completion(resultFrmCompletion: "JSON Success")
//                }
//              }
//              }
//            
//            
//          }
//          catch{
//            dispatch_async(dispatch_get_main_queue()){
//              
//              completion(resultFrmCompletion: "JSON Error")
//            }
//            
//          }
          
          do {
            
            if let jsonObj = try NSJSONSerialization.JSONObjectWithData(dataBlock!, options: .AllowFragments) as? JSONDictionary, feedFrmJson = jsonObj["feed"] as? JSONDictionary, entriesFromJsn = feedFrmJson["entry"] as? JSONArray
            
            {
            
              var videosObj = [VideosClass]()
              
//              for entryLoop in entriesFromJsn
              for (index, entryLoop ) in entriesFromJsn.enumerate() {
                
                let entryObj = VideosClass(data: entryLoop as! JSONDictionary)
                
                entryObj.vRankVC = index + 1
                
                videosObj.append(entryObj)
                
              }
              
              
              
              let iCount = videosObj.count
              print("iTunesAPIManager total count --> \(iCount)")
              print("")
              
              
              let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
              
                              dispatch_async(dispatch_get_main_queue()){
              
//                                completion(resultFrmCompletion: "JSON Success")
                                completion(videosObj)
                                
                              }
                            }
              
            }
            
            
          }catch{
            dispatch_async(dispatch_get_main_queue()){
              
//                            completion(resultFrmCompletion: "JSON Error")
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
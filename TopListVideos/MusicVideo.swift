//
//  MusicVideo.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 9-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import Foundation

class VideosClass {
  //Data encapsultion
  private var _vNameVC : String
  private var _vImgUrlVC: String
  private var _vVideoUrlVC: String
  
  
  
  // Make getter
  
  var vNameVC: String {
    return _vNameVC
    
  }
  
  var vImgUrlVC: String {
    return _vImgUrlVC
    
  }
  
  var vVideoUrlVC: String {
    
    return _vVideoUrlVC
  }
  
  
  
  init(data: JSONDictionary) {
    
    //name
      
      if let name = data["im:name"] as? JSONDictionary, vNameVC = name ["label"] as? String {
        self._vNameVC = vNameVC
      }
    
      
   
    else{
      
      _vNameVC = ""
          }
    
    //Image
    
    if let imge = data["im:image"] as? JSONArray, image = imge[1] as? JSONDictionary,  imgUrl = image ["label"] as? String
    {
      _vImgUrlVC = imgUrl.stringByReplacingOccurrencesOfString("71x53", withString: "600x600")
    }
      
    else{
      
      _vImgUrlVC = ""

    }
    
    //video
   
    
    if let video = data ["link"] as? JSONArray,
    vid = video[0] as? JSONDictionary,
    videoGraph = vid["attributes"] as? JSONDictionary,
    attributes = videoGraph ["href"] as? String
    {
      self._vVideoUrlVC = attributes
    }
    
    
    else{
      
      _vVideoUrlVC = ""
    }
    
    

    
    
    
    
    
  }
  
  
  
  
  //videosClass ends
}
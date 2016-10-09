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
  
  private var _vRightsVC : String
  private var _vPriceVC : String
  private var _vArtistVC : String
  private var _vImidVC : String
  private var _vGenreVC : String
  private var _vLinkToiTunesVC : String
  private var _vReleaseDtVC : String

  //this var gets created from UI
  var imageData : NSData?
  
  
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
  
//   private var _vRightsVC : String
  
  var vRightsVC : String {
    
    return _vRightsVC
    
  }
  
//      private var _vPriceVC : String
  var vPriceVC : String {
    
    return _vPriceVC
    
  }

  
  
//   private var _vArtistVC : String
  var vArtistVC : String {
    
    return _vArtistVC
    
  }
//   private var _vImidVC : String
  var vImidVC : String {
    
    return _vImidVC
    
  }
//   private var _vGenreVC : String
  
  var vGenreVC : String {
    
    return _vGenreVC
    
  }
  
//   private var _vLinkToiTunesVC : String
  var vLinkToiTunesVC : String {
    
    return _vLinkToiTunesVC
    
  }
  
  
//   private var _vReleaseDtVC : String
  var vReleaseDtVC : String {
    
    return _vReleaseDtVC
    
  }

  
  
  
  //initializers
  
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
    
//    private var _vRightsVC : String
    if let rights = data ["rights"] as? JSONDictionary,
      vRghts = rights ["label"] as? String
    {
      self._vRightsVC = vRghts
      
      
    }else{
      _vRightsVC = ""
    }
   //    private var _vPriceVC : String
    
    if let price = data ["im:price"] as?JSONDictionary,
    
    priceLabel = price ["label"] as? String
    {
      
      self._vPriceVC = priceLabel
      
    }else {
      
      _vPriceVC = ""
    }
    
//    private var _vArtistVC : String
    
    if let artist = data["im:artist"] as? JSONDictionary,
    artistLabel = artist["label"] as? String
    {
      
      self._vArtistVC = artistLabel
      
    }else{
      _vArtistVC = ""
    }
    
//    private var _vImidVC : String
    
    if let imid = data ["id"] as? JSONDictionary,
    atributeID = imid ["attributes"] as? JSONDictionary,
    id = atributeID ["im:id"] as? String
    
    {
      self._vImidVC = id
      
    }else{
      _vImidVC = ""
    }
    
//    private var _vGenreVC : String
    
    if let genre = data ["category"] as? JSONDictionary,
    attributes = genre ["attributes"] as? JSONDictionary,
    term = attributes ["attributes"] as? String
    {
      self._vGenreVC = term
      
      
    }else{
      _vGenreVC = ""
    }
    
    
//    private var _vLinkToiTunesVC : String
    
    if let id = data["id"] as? JSONDictionary,
    linkToiTunes = id ["label"] as? String
    {
      self._vLinkToiTunesVC = linkToiTunes
    }else{
      _vLinkToiTunesVC = ""
      
    }
      
    
//    private var _vReleaseDtVC : String
      if let dte = data ["im:releaseDate"] as? JSONDictionary,
      releaseDt = dte ["attributes"] as? JSONDictionary,
      vRlsDte = releaseDt ["label"] as? String
    {
      
      self._vReleaseDtVC = vRlsDte
      
    }else{
      _vReleaseDtVC = ""
    }
 
    
    
    
    
    
    //data ends
  
  }
  
    

  
  
  
  
  //videosClass ends

}
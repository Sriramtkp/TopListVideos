//
//  ViewController.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 9-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //step 1
    
    let api = APIManager ()
    api.loadData("https://itunes.apple.com/in/rss/topmusicvideos/limit=200/json",completion: didLoadData)
    
//    api.loadData("https://itunes.apple.com/in/rss/topmusicvideos/limit=10/json"){
//      
//      (result: String) in
//      
//      print(result)
//    }
//
    
    
    
    
    
  //viewDidLoad ends
  }


  // Helper func
//  func didLoadData(result: String)
  func didLoadData(videosArray : [VideosClass])  {
    
//    print("func in viewDidLoad is \(result)")
    
    
//    let alertObj = UIAlertController(title: (result), message: "hi R.D", preferredStyle: .Alert)
//    
//    let okAction = UIAlertAction(title: "Okay", style: .Default) { (action) in
//      
//      //do your stuff
//    }
//    
//    alertObj.addAction(okAction)
//    self.presentViewController(alertObj, animated: true, completion: nil)
    
//    for videoItem in videosArray {
//      print("one of the objects in VideoArray-- \(videoItem.vNameVC)")
//    }
    
//    for i in 0..<videosArray.count {
//      
//      print(i)
//      let video = videosArray[i]
//      
//      print(video.vNameVC)
//      
//      
//    }
    
    for (index, item) in videosArray.enumerate() {
      print("\(index) = \(item.vNameVC)")
    }
    
    
    
    
   //didLoadData ends
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


//ViewController ends
}


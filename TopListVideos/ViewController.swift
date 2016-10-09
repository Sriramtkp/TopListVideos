//
//  ViewController.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 9-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

  var videosArrVC = [VideosClass]()
  
  
  @IBOutlet weak var labelNetStatus: UILabel!
  
  @IBOutlet weak var tableViewOutlet: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.  #selector(AppDelegate.reachChanged
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.statusChanged), name: "ReachStatusChanged", object: nil)
    
    statusChanged()
    
    //step 1  Call API
    
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
  func didLoadData(videosArrVC: [VideosClass])  {
    
  print(reachStatusGlObj)
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
    self.videosArrVC = videosArrVC
    
    for (index, item) in videosArrVC.enumerate() {
      print("\(index) = \(item.vNameVC)")
    }
    
    tableViewOutlet.reloadData()
    
    
   //didLoadData ends
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  
  func statusChanged()  {
    
    
    switch reachStatusGlObj {
    case NOACCESS : self.labelNetStatus.text = "No internet"
    print(NOACCESS)
      self.labelNetStatus.textColor = UIColor.redColor()
    case WIFI : self.labelNetStatus.text = "WiFi"
    print("Wifi")
    self.labelNetStatus.textColor = UIColor.greenColor()
    case  WANN : self.labelNetStatus.text = "Cellular Data"
    self.labelNetStatus.textColor = UIColor.blueColor()
    default: return
    }
    
//    NSNotificationCenter.defaultCenter().postNotificationName("ReachStatusChanged", object: nil)
    
    
  }
  
  
  deinit{
    
    NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
    
  }
  
  
  //MARK : TableView funcs
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  
  {
   return videosArrVC.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
    
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
    
    let videoObj = videosArrVC[indexPath.row]
    cell.textLabel?.text = ("\(indexPath.row + 1)")
    cell.detailTextLabel?.text = videoObj.vNameVC
    
    return cell
  }
  


//ViewController ends
}


//
//  MusicVideoTVC.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 10-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import UIKit

class MusicVideoTVC: UITableViewController {

  var videosArrVC = [VideosClass]()
  
  
  @IBOutlet weak var labelNetStatus: UILabel!
  
  @IBOutlet weak var tableViewOutlet: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.  #selector(AppDelegate.reachChanged
    
    
    self.title = "iTunes Top 10 Music Videos"
    self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.redColor()]
    
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MusicVideoTVC.statusChanged), name: "ReachStatusChanged", object: nil)
    
    statusChanged()
    
    //observer for font
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MusicVideoTVC.preferFontChange), name: UIContentSizeCategoryDidChangeNotification, object: nil)
    
    
    
        //viewDidLoad ends
  }
  
  
  func runAPI() {
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

  }
  
  
  
  
  //MARK: Helper func
  func preferFontChange() {
    print("font changes")
  }
  
  
  
  
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
  //MARK:displayAlert
  func displayAlert(titleMsg: String, MessageTxt: String) {
    
    dispatch_async(dispatch_get_main_queue(), {
      
      let alert = UIAlertController(title: titleMsg , message: MessageTxt , preferredStyle: .Alert)
      
      let saveAction = UIAlertAction(title: "Ok", style: .Default) {
        (action: UIAlertAction) -> Void in
        
        self.dismissViewControllerAnimated(true, completion: nil)
      }
      alert.addAction(saveAction)
      alert.view.setNeedsLayout()
      self.presentViewController(alert, animated: true, completion: nil)
      
      
    })
    
  }
  
  //MARK: Wifi Status
  func statusChanged()  {
       switch reachStatusGlObj {
    case NOACCESS :
    print(NOACCESS)
      
//    ----------Simple Alert -----

    dispatch_async(dispatch_get_main_queue(), {
      
      self.displayAlert("No Internet", MessageTxt: "Please check the settings")
      
    })
    case WIFI :
    print("Wifi")
    case  WANN :
      print("WANN")
    default: return
    }
    
    //    NSNotificationCenter.defaultCenter().postNotificationName("ReachStatusChanged", object: nil)
    
    if self.videosArrVC.count > 0 {
      print("do not refresh API")
    }else{
      runAPI()
    }
    
      }
  
  //MARK: removeObserver
  deinit{
    
    NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
    
    NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    
  }
  
  
  //MARK: Storyboard
  
  private struct storyboard {
    
    
    static let CellReusableIdentifier = "cell"
    static let segueIdentifier = "musicDetail"
    
    
  }
  
  
  
  //MARK: TableView funcs
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
  {
    return videosArrVC.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
    
    let cell = tableView.dequeueReusableCellWithIdentifier(storyboard.CellReusableIdentifier, forIndexPath: indexPath) as! MusicTableViewCell
    
//    let videoObj = videosArrVC[indexPath.row]
//    cell.textLabel?.text = ("\(indexPath.row + 1)")
//    cell.detailTextLabel?.text = videoObj.vNameVC

    cell.videoObj = videosArrVC[indexPath.row]
    
    
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == storyboard.segueIdentifier {
      
      if let indPath = tableViewOutlet.indexPathForSelectedRow {
         let video = videosArrVC[indPath.row]
        
        let dvc = segue.destinationViewController as! MusicVideoDetailVC
        
        dvc.videos = video
        
      }
      
      
      
    }
    
     }
  
  //MARK: ViewController ends
}

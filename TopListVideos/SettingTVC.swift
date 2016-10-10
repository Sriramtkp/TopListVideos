//
//  SettingTVC.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 10-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import UIKit
import MessageUI

class SettingTVC: UITableViewController, MFMailComposeViewControllerDelegate {

//  let defaults = NSUserDefaults.standardUserDefaults()

  
  //MARK: Outlets
  
  
  @IBOutlet weak var aboutLabel: UILabel!
  
  
  @IBOutlet weak var feedbackLabel: UILabel!
  
  @IBOutlet weak var securityTouchIDSwitch: UISwitch!
  
  @IBOutlet weak var scurityLabel: UILabel!
  @IBOutlet weak var bestImageLabel: UILabel!
  
  
  @IBOutlet weak var sliderCount: UISlider!
  
  @IBOutlet weak var apiCountLabel: UILabel!
  
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      title = "Setting"
      
      NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SettingTVC.preferredFont), name: UIContentSizeCategoryDidChangeNotification, object: nil)
      
      securityTouchIDSwitch.on = NSUserDefaults.standardUserDefaults().boolForKey("TouchID")
      
      
      if (NSUserDefaults.standardUserDefaults().objectForKey("APICount") != nil) {
        
        let theVaue = NSUserDefaults.standardUserDefaults().objectForKey("APICount") as! Int
        apiCountLabel.text = "\(theVaue)"
        sliderCount.value = Float(theVaue)
      }else{
        sliderCount.value = 10.0
        apiCountLabel.text = ("\(Int(sliderCount.value))")
        
      }
      
      
      }

  
  
  func preferredFont() {
    aboutLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    feedbackLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    scurityLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    bestImageLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    apiCountLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    

  }
  
  deinit{
    
    NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    
  }
  
  //MARK: IBActions
  @IBAction func touchIDSecAction(sender: UISwitch) {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    if securityTouchIDSwitch.on {
      
      defaults.setBool(securityTouchIDSwitch.on, forKey: "TouchID")
      
    }else{
      defaults.setBool(false, forKey: "TouchID")
    }
    
  }
  
  @IBAction func bestQualityAction(sender: UISwitch) {
    
   
      }
  
  
  
  @IBAction func sliderAction(sender: UISlider) {
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    defaults.setObject(Int(sliderCount.value), forKey: "APICount")
    apiCountLabel.text = ("\(Int(sliderCount.value))")
    
    
  }
  
  //MARK: didSelect TableView func
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if indexPath.section == 0 && indexPath.row == 1 {
      
      let mailComposeVC = configureMail()
      
      if MFMailComposeViewController.canSendMail() {

      self.presentViewController(mailComposeVC, animated: true, completion: nil)
        
      }else{
        mailAlert()
      }
      
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
  }
  
  func configureMail() -> MFMailComposeViewController {
    
    let msgVC = MFMailComposeViewController()
    msgVC.mailComposeDelegate = self
    msgVC.setSubject("Feedback")
    msgVC.setToRecipients(["sriramrajendrantkp@yahoo.in"])
    msgVC.setMessageBody("Hi", isHTML: false)
    
    return msgVC
    
    
    
  }
  
  func mailAlert()  {
    print("Error in mail")
  }
  
  func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
    
    
    
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  
  
    //MARK: Class Ends
    }

//
//  SettingTVC.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 10-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import UIKit

class SettingTVC: UITableViewController {

  
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
  
  
  
  //MARK: Class Ends
    }
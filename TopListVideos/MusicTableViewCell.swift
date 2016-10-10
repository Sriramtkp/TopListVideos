//
//  MusicTableViewCell.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 10-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

  var videoObj: VideosClass? {
    
    didSet {
      updateCell()
    }
    
  }
  
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var rankLabel: UILabel!
  
  
  @IBOutlet weak var imageViewCell: UIImageView!
  
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  
  
  func updateCell() {
    
    titleLabel.text = videoObj?.vNameVC
    rankLabel.text = "\(videoObj!.vRankVC)"
//    imageViewCell.image = UIImage(named: "NoImage")
    
    
    titleLabel.font =  UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    rankLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    
    
    
    
    if videoObj?.vImageData != nil {
      
      imageViewCell.image = UIImage(data: videoObj!.vImageData!)
      
    }else{
      getVideoImage(videoObj!, imageP: imageViewCell)
      
    }
    
    
    
  }
  
  func getVideoImage(videoP: VideosClass, imageP : UIImageView) {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
      
      let data = NSData(contentsOfURL: NSURL(string: self.videoObj!.vImgUrlVC)!)

      
      
      var img : UIImage?
      if data != nil {
        
        self.videoObj?.vImageData = data
        img = UIImage(data: data!)
        
      }
      dispatch_async(dispatch_get_main_queue()){
        
        imageP.image = img
        
      }
      
    }
    
    
    
    
    
    
  }
  
  
  //MARK: MusicTableViewCell ends
  
}

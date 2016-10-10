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
    imageViewCell.image = UIImage(named: "NoImage")
    
    
    
    
  }
  
  
  
  
  //MARK: MusicTableViewCell ends
  
}

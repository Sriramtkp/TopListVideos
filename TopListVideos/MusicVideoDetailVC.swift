//
//  MusicVideoDetailVC.swift
//  TopListVideos
//
//  Created by Sriram Rajendran on 10-10-16.
//  Copyright © 2016 Sriram Rajendran. All rights reserved.
//

import UIKit

class MusicVideoDetailVC: UIViewController {

  var videos : VideosClass!
  //MARK: outlets
  
  
  @IBOutlet weak var imageViewOutlet: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var genreLabel: UILabel!
  
  
  @IBOutlet weak var rightsLabel: UILabel!
  
  @IBOutlet weak var priceLabel: UILabel!
  
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      title = videos.vArtistVC
      rightsLabel.text = videos.vRightsVC
      nameLabel.text = videos.vNameVC
      genreLabel.text = videos.vGenreVC
      priceLabel.text = videos.vPriceVC
      
      if videos.vImageData != nil {
        
        imageViewOutlet.image = UIImage(data: videos.vImageData!)
        
        
      }else{
        imageViewOutlet.image = UIImage(named: "NoImage")
      }
      
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

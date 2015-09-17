//
//  PhotosTableViewCell.swift
//  InstagramFeed
//
//  Created by admin on 9/16/15.
//  Copyright © 2015 mattmo. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var instagramImageView: UIImageView?
//    var imageURL : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInstagramImage(imageURL: String) {
        self.instagramImageView? .setImageWithURL(NSURL(string: imageURL)!)
    }
}

//
//  VideoTableViewCell.swift
//  Random
//
//  Created by Josefina Perez on 13/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit
import Kingfisher

class VideoTableViewCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
     @IBOutlet var lblDescription: UILabel!
     @IBOutlet var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    func configurar(video: Video) {
        lblTitle.text = video.title
//        lblDescription.text = video.description
        
        if let url = URL(string: video.img) {
            img.kf.setImage(with: url)
        }
    }
    
    
}

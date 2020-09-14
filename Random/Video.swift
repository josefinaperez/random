//
//  Video.swift
//  Random
//
//  Created by Josefina Perez on 12/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import Foundation
import SwiftyJSON


class Video{
    var title: String
    var description: String
    var img: String
    
    init(json: JSON) {
        self.title = json["snippet"]["title"].stringValue
        self.description = json["snippet"]["description"].stringValue
        self.img = json["snippet"]["thumbnails"]["default"]["url"].stringValue
    }
    
}

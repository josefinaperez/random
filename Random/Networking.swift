//
//  Networking.swift
//  Random
//
//  Created by Josefina Perez on 12/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Networking {
    
   static func getChannelId(channel: String, completionHandler: @escaping(_ id: String?, _ error: Error?) -> Void){
        
        let urlString = "https://www.googleapis.com/youtube/v3/channels?part=id&forUsername=\(channel)&key=AIzaSyDR8KWwQz6nhK6KkQs69zvWGebA4FrO8RQ"
        
        AF.request(urlString).validate().responseJSON(completionHandler: {response in
            
            if let error = response.error{
                print(error.errorDescription)
                
                completionHandler(nil, error)
                
            }
            else if let value = response.value{
                let json = JSON(value)
                let id = json["items"].arrayValue.first?["id"].stringValue
                
                completionHandler(id, nil)
            }
        })
    }
    
   static func getVideos(id: String, completionHandler: @escaping(_ videos: [Video]?, _ error: Error?) -> Void){
        
        let urlString = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyDR8KWwQz6nhK6KkQs69zvWGebA4FrO8RQ&channelId=\(id)&part=snippet,id&order=date&maxResults=50"
        
        AF.request(urlString).validate().responseJSON(completionHandler: {response in
            
            if let error = response.error{
                print(error.errorDescription)
                completionHandler(nil, error)
            }
            else if let value = response.value{
                let json = JSON(value)
                let videosJson = json["items"].arrayValue
                var videos: [Video] = []
                
                for videoJ in videosJson{
                    let video = Video(json: videoJ)
                    videos.append(video)
                }
                
                completionHandler(videos, nil)
            }
        })
    }
}

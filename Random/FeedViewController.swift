//
//  FeedViewController.swift
//  Random
//
//  Created by Josefina Perez on 12/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var arrayVideos: [Video] = []
    
    @IBOutlet var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
       
    }

}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VideoTableViewCell
        
        cell.configurar(video: arrayVideos[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}

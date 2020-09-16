//
//  InicioViewController.swift
//  Random
//
//  Created by Josefina Perez on 12/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {

    @IBOutlet var btn: UIButton!
    @IBOutlet var txtField: UITextField!
    
    var nombreCanal: String = ""
    
    var arrayVideos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtField.placeholder = "fill me..."
        txtField.delegate = self
        
        self.title = "inicio"
        view.backgroundColor = .red
    }
    
    func getVideoss(id: String){
        Networking.getVideos(id: id, completionHandler: {videos, error in
            if let error =  error{
                print(error)
            }
            
            else if let videos = videos {
                self.showFeed(array: videos)
            }
        })
    }
    
    func getId(){
        Networking.getChannelId(channel: nombreCanal, completionHandler: {
            id, error in
            
            if let error = error{
                print(error)
            }
            else if let id = id{
                self.getVideoss(id: id)
            }
        })
    }
    
    
    
    @IBAction func next(){
        if txtField != nil{
            getId()
    }
    }
    
    func showFeed(array: [Video]){
        let vc = storyboard?.instantiateViewController(withIdentifier: "feed") as! FeedViewController
        vc.arrayVideos = array
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension InicioViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nombreCanal = txtField.text!
    
    }
    
}

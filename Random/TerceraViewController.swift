//
//  TerceraViewController.swift
//  Random
//
//  Created by Josefina Perez on 03/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit

class TerceraViewController: UIViewController {

    
    @IBOutlet var lbl: UILabel!
    @IBOutlet var textF: UITextField!
    @IBOutlet var textV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textF.placeholder = "escribi algo"
        textF.delegate = self
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TerceraViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        lbl.text = textField.text
    }
}



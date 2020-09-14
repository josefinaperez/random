//
//  PrimeraViewController.swift
//  Random
//
//  Created by Josefina Perez on 03/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit

class PrimeraViewController: UIViewController {

    @IBOutlet var lbl: UILabel!
    @IBOutlet var btn: UIButton!
    @IBOutlet var stich: UISwitch!
    @IBOutlet var piky: UIPickerView!
    @IBOutlet var lbl1: UILabel!
    
    var array = ["la", "puta", "vieja", "de", "la", "Eileen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btn.setTitle("siguiente", for: .normal)
        btn.isHidden = true
        
        stich.onTintColor = .red
        stich.isOn = false
      
        lbl.textAlignment = .center
        
        piky.tintColor = .systemGreen
        piky.dataSource = self
        piky.delegate = self
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.backgroundColor = .red

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if view.backgroundColor == .red{
            view.backgroundColor = .white
        }
        
    }
    
    
    
    
    @IBAction func lilo(){
        if stich.isOn == true{
        
        btn.isHidden = false
        }
        else{
            btn.isHidden = true
        }
    }

    @IBAction func siguente(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "segunda") as! SegundaViewController
        vc.pantalla = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PrimeraViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lbl1.text = array[row]
    }
}

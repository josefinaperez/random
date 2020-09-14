//
//  DosViewController.swift
//  Random
//
//  Created by Josefina Perez on 01/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit

class DosViewController: UIViewController {

    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var lblContraseña: UILabel!
    @IBOutlet var btn: UIButton!
    
    var contraseña: String?
    var nombre: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombre = UserDefaults.standard.string(forKey: "nombre")
        
        contraseña = UserDefaults.standard.string(forKey: "contraseña")
        
        lblNombre.text = nombre
        lblContraseña.text = contraseña
        
    }
    
    @IBAction func volver(){
        
        UserDefaults.standard.removeObject(forKey: "nombre")
        UserDefaults.standard.synchronize()
        
        UserDefaults.standard.removeObject(forKey: "contraseña")
        UserDefaults.standard.synchronize()
        navigationController?.popViewController(animated: true)
    }

}

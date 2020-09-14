//
//  UnoViewController.swift
//  Random
//
//  Created by Josefina Perez on 01/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit

class UnoViewController: UIViewController {
    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var lblContraseña: UILabel!
    @IBOutlet var txtNombre: UITextField!
    @IBOutlet var txtContraseña: UITextField!
    @IBOutlet var btnBai: UIButton!
    
    var nombre: String = ""
    var contraseña: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNombre.text = "Nombre"
        lblContraseña.text = "Contraseña"
        
        btnBai.setTitle("next", for: .normal)
        btnBai.backgroundColor = .yellow
        btnBai.tintColor = .black

        txtNombre.delegate = self
        txtContraseña.delegate = self
        print("viewDidLoad")
//        logueado()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    @IBAction func next(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "two") as! DosViewController
        
        guardar()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func guardar(){
//        UserDefaults.standard.set(true, forKey: "log")
//        UserDefaults.standard.synchronize()
        UserDefaults.standard.set(nombre, forKey: "nombre")
        UserDefaults.standard.synchronize()

        UserDefaults.standard.set(contraseña, forKey: "contraseña")
        UserDefaults.standard.synchronize()
        
    }
    
//    func logueado() {
//        UserDefaults.standard.synchronize()
//
//        let log = UserDefaults.standard.bool(forKey: "log")
//
//        if log {
//            next()
//        }
//    }
}

extension UnoViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtNombre{
            nombre = txtNombre.text!
        }
        else if textField == txtContraseña{
            contraseña = txtContraseña.text!
        }
        
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

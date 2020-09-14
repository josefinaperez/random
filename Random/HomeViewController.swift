//
//  ViewController.swift
//  Random
//
//  Created by Josefina Perez on 29/08/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var llbResultado: UILabel!
    
    @IBOutlet var btnCero: UIButton!
    @IBOutlet var btnUno: UIButton!
    @IBOutlet var btnDos: UIButton!
    @IBOutlet var btnTres: UIButton!
    @IBOutlet var btnCuatro: UIButton!
    @IBOutlet var btnCinco: UIButton!
    @IBOutlet var btnSeis: UIButton!
    @IBOutlet var btnSiete: UIButton!
    @IBOutlet var btnOcho: UIButton!
    @IBOutlet var btnNueve: UIButton!
    @IBOutlet var btnDecimal: UIButton!
    @IBOutlet var btnClear: UIButton!
    @IBOutlet var btnMasMenos: UIButton!
    @IBOutlet var btnPorcentaje: UIButton!
    @IBOutlet var btnDivision: UIButton!
    @IBOutlet var btnMultiplicar: UIButton!
    @IBOutlet var btnMenos: UIButton!
    @IBOutlet var btnMas: UIButton!
    @IBOutlet var btnResultado: UIButton!
    
    private var total: Double = 0
    private var temp: Double = 0
    private var operating: Bool = false
    private var decimal: Bool = false
    private var operation: operationType = .none

    private enum operationType{
        case none, sume, resta, division, multiplicacion, porcentaje
    }
    
    private let decimalSeparator = Locale.current.decimalSeparator
    private let maxLength = 9
    private let totalTotal = "total"
//    private let maxValue = 999999999
//    private let minValue = 0.00000001
    
    // Formateo de valores auxiliares
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // Formateo de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // Formateo de valores por pantalla en formato científico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    // Formateo de valores auxiliares totales
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Mi Calculadora"
        
        btnCero.round()
        btnUno.round()
        btnDos.round()
        btnTres.round()
        btnCuatro.round()
        btnCinco.round()
        btnSeis.round()
        btnSiete.round()
        btnOcho.round()
        btnNueve.round()
        
        btnClear.round()
        btnDecimal.round()
        btnMasMenos.round()
        btnPorcentaje.round()
        btnDivision.round()
        btnMultiplicar.round()
        btnMenos.round()
        btnMas.round()
        btnResultado.round()
        
        btnDecimal.setTitle(decimalSeparator, for: .normal)
        
        total = UserDefaults.standard.double(forKey: totalTotal)
        
        result()
    }
    
    @IBAction func operadorClear(_ sender: UIButton){
        clear()
        sender.shine()
        
    }
    
    @IBAction func operadorMasMenos(_ sender: UIButton){
        temp = temp * (-1)
        llbResultado.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func operadorPorcentaje(_ sender: UIButton){
        if operation != .porcentaje{
            result()
        }
        operating = true
        operation = .porcentaje
        result()
        sender.shine()
        
    }
    
    @IBAction func operadorDivision(_ sender: UIButton){
        if operation != .none{
        result()
        }
        operating = true
        operation = .division
               
        sender.shine()
    }
    
    @IBAction func operadorMultiplicar(_ sender: UIButton){
        if operation != .none{
        result()
        }
        operating = true
        operation = .multiplicacion
        sender.shine()
    }
    
    @IBAction func operadorMenos(_ sender: UIButton){
        if operation != .none{
        result()
        }
        operating = true
        operation = .resta
        sender.shine()
    }
    
    @IBAction func operadorMas(_ sender: UIButton){
        
        if operation != .none{
        result()
        }
        operating = true
        operation = .sume
        sender.shine()
    }
    
    @IBAction func operadorResultado(_ sender: UIButton){
        result()
        sender.shine()
    }
    
    @IBAction func decimal(_ sender: UIButton){
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        
        if !operating && currentTemp.count >= maxLength {
                    return
        }

        llbResultado.text = llbResultado.text! + decimalSeparator!
        decimal = true

    }
    
    @IBAction func Numeros(_ sender: UIButton) {
        
        btnClear.setTitle("C", for: .normal)
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= maxLength {
                    return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        if operating {
            
            total = total == 0 ? temp : total
            llbResultado.text = ""
            currentTemp = ""
            operating = true
        }
        
        if decimal{
            currentTemp = "\(currentTemp)\(decimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        llbResultado.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    
    func clear(){
        temp = 0
        operating = false
        operation = .none
        btnClear.setTitle("AC", for: .normal)

        if total != 0{
            total = 0
            llbResultado.text = "0"
        }
        else{
            total = 0
        }
        result()

    }
    
    func result() {
        switch  operation{
     
        case .none:
            break
        case .sume:
            total += temp
            break
        case .resta:
            total -= temp
            break
        case .division:
            total /= temp
            break
        case .multiplicacion:
            total *= temp
            break
        case .porcentaje:
            temp = temp / 100
            total = temp
            break
        }
        
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > maxLength{
            llbResultado.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else{
            llbResultado.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        UserDefaults.standard.set(total, forKey: totalTotal)

          operation = .none
    }
}


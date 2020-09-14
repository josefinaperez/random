//
//  SegundaViewController.swift
//  Random
//
//  Created by Josefina Perez on 03/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit

class SegundaViewController: UIViewController {

    @IBOutlet var lbl: UILabel!
    @IBOutlet var step: UIStepper!
    @IBOutlet var btn: UIButton!
    @IBOutlet var img: UIImageView!
    @IBOutlet var pag: UIPageControl!
    @IBOutlet var actIndicator: UIActivityIndicatorView!
    @IBOutlet var progreso: UIProgressView!
    @IBOutlet var sControl: UISegmentedControl!
    @IBOutlet var slide: UISlider!
    
    var pantalla: PrimeraViewController?
    var total = 0
    
    var arrayI = [UIImage(systemName: "trash"),UIImage(systemName: "trash.fill"), UIImage(systemName: "trash.circle")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        step.minimumValue = 0
        step.isEnabled = true
        
        lbl.text = "\(total)"
        
        pag.pageIndicatorTintColor = .red
        pag.currentPageIndicatorTintColor = .black
        pag.numberOfPages = arrayI.count
        
        progreso.progress = 0
        actIndicator.startAnimating()
        actIndicator.color = .systemPink
        
        sControl.insertSegment(withTitle: "tres", at: 2, animated: true)
        
        slide.maximumTrackTintColor = .orange
        slide.minimumValue = 0
        slide.maximumValue = Float(arrayI.count)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lbl.text = pantalla?.lbl.text
        
        if let stringtotal = pantalla?.lbl.text, let tot = Int(stringtotal){
            
            total = tot
        }
    }
    
    @IBAction func suma(){
      total += 1
      lbl.text = "\(total)"
    }
    
    @IBAction func siguiente(){
        pantalla?.lbl.text = "\(total)"
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func page(){
        
        if pag.currentPage == 0{
            
            progreso.progress = 0.33 // 1/3
            
        }
        else if pag.currentPage == 1{
        
            progreso.progress = 0.66 // 2/3
           
        }
        else {
    
            progreso.progress = 1.0 // 3/3
        }
        
        img.image = arrayI[pag.currentPage]
        sControl.selectedSegmentIndex = pag.currentPage
        actIndicator.isHidden =  true
//        progreso.progress = (pag.currentPage + 1) / 3
        slide.value = Float(pag.currentPage)
    }
    
    @IBAction func segControl() {
        pag.currentPage = sControl.selectedSegmentIndex
        slide.value = Float(sControl.selectedSegmentIndex)
        
        img.image = arrayI[sControl.selectedSegmentIndex]
        progreso.progress = Float(sControl.selectedSegmentIndex + 1) / 3
        
        actIndicator.isHidden = true
    }
    
    
    @IBAction func slider(){
        slide.value = Float(sControl.selectedSegmentIndex)
        img.image = arrayI[Int(slide.value)]
        progreso.progress = slide.value
        actIndicator.isHidden = true
    }
}



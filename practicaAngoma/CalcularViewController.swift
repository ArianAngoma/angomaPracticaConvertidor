//
//  CalcularViewController.swift
//  practicaAngoma
//
//  Created by Arian Angoma on 10/05/19.
//  Copyright © 2019 angoma.pe.edu.tecsup. All rights reserved.
//

import UIKit

class CalcularViewController: UIViewController {
    
    
    @IBOutlet weak var unidadPrimero: UITextField!
    
    @IBOutlet weak var datoPrimero: UITextField!
    
    @IBOutlet weak var unidadFinal: UITextField!
    
    @IBOutlet weak var datoFinal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func calcular(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var final : Double? = 0
        
        if unidadPrimero.text == "Millas" && unidadFinal.text == "Yardas" {
            final = Double(datoPrimero.text!)! * 1760
            datoFinal.text = "\( final! ) yardas"
        }
        else if unidadPrimero.text == "Millas" && unidadFinal.text == "Kilometros"{
            final = Double(datoPrimero.text!)! / 0.62137
            datoFinal.text = "\(final! ) Kilometros"
        }
        else if unidadPrimero.text == "Yardas" && unidadFinal.text == "Millas"{
            final = Double(datoPrimero.text!)! * 0.00056818
            datoFinal.text = "\( final! ) Millas"
        }
        else if unidadPrimero.text == "Yardas" && unidadFinal.text == "Kilometros"{
            final = Double(datoPrimero.text!)! / 1093.6
            datoFinal.text = "\( final! ) Kilometros"
        }
        else if unidadPrimero.text == "Kilometros" && unidadFinal.text == "Yardas"{
            final = Double(datoPrimero.text!)! * 1093.61
            datoFinal.text = "\( final! ) yardas"
        }
        else if unidadPrimero.text == "Kilometros" && unidadFinal.text == "Millas"{
            final = Double(datoPrimero.text!)! * 0.62137
            datoFinal.text = "\( final! ) Millas"
        }
        
        let unidad = Unidad(context: context)
        unidad.datoPrimero = Double(datoPrimero.text!)!
        unidad.unidadPrimero = unidadPrimero.text!
        unidad.unidadFinal = unidadFinal.text!
        unidad.datoFinal = final!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
}

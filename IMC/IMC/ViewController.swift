//
//  ViewController.swift
//  IMC
//
//  Created by Vinicius Loss on 23/12/22.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var tf_nr_peso: UITextField!
    @IBOutlet weak var tf_nr_altura: UITextField!
    @IBOutlet weak var txt_resultado: UILabel!
    @IBOutlet weak var img_resultado: UIImageView!
    @IBOutlet weak var view_resultado: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func btn_calcular(_ sender: Any) {
        
        print(tf_nr_peso.text!)
        print(tf_nr_altura.text!)
        
        if let PESO = Double(tf_nr_peso.text!), let ALTURA = Double(tf_nr_altura.text!){
            imc = PESO / (ALTURA * ALTURA)
            
            print("PESO: ")
            print(PESO)
            print("ALTURA: ")
            print(ALTURA)
            showResultado()
        }
    }
    
    func showResultado(){
    
        print("IMC: ")
        print(imc)

        
        var TXT_RESULTADO: String = ""
        var IMG_RESULTADO: String = ""
        
        switch imc {
            case 0..<16:
                TXT_RESULTADO = "Magreza"
                IMG_RESULTADO = "abaixo"
                
            case 16..<18.5:
                TXT_RESULTADO = "Abaixo do Peso"
                IMG_RESULTADO = "abaixo"
                
            case 18.5..<25:
                TXT_RESULTADO = "Peso Ideal"
                IMG_RESULTADO = "ideal"
                
            case 25..<30:
                TXT_RESULTADO = "Sobrepeso"
                IMG_RESULTADO = "sobre"
                
            default:
                TXT_RESULTADO = "Obesidade"
                IMG_RESULTADO = "obesidade"
        }
        
        txt_resultado.text = "\(Int(imc)): \(TXT_RESULTADO)"
        img_resultado.image = UIImage(named: IMG_RESULTADO)
        view_resultado.isHidden = false
        
        view.endEditing(true)
    }
    
}


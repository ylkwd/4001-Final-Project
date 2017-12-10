//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Yaoxuan Luan on 11/7/17.
//  Copyright © 2017 Yaoxuan Luan. All rights reserved.
//

import UIKit


struct Converter {              //array struct
    var label: String
    var input_Unit: String
    var output_Unit: String
}

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var ConvertersArray = [Converter]() //init array
    let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //give array instances
    ConvertersArray =
        [
            Converter(label: "fahrenheit to celcius", input_Unit: "°F", output_Unit: "°C"),
            Converter(label: "celcius to fahrenheit", input_Unit: "°C", output_Unit: "°F"),
            Converter(label: "miles to kilometers", input_Unit: "mi", output_Unit: "km"),
            Converter(label: "kilometers to miles", input_Unit: "km", output_Unit: "mi")
        ]
        
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterButtonTapped(_ sender: Any) {
        
        for converter in ConvertersArray {              //for-in accessing ConvertersArray print alert
            alert.addAction(UIAlertAction(title: converter.label, style: .default, handler: nil))
        }
        self.present(alert, animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


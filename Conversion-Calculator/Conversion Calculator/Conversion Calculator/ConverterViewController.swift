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
    
    @IBOutlet weak var blueText: UITextField!
    @IBOutlet weak var whiteText: UITextField!
    
    var numbers: String = ""
    var choice: Int = 1
    var count = 0
    var current = 0
    var result: Double = 0
    var ConvertersArray = [Converter]() //init array
    let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.whiteText.text = "°F"
        self.blueText.text = "°C"
        
    //give array instances
//    ConvertersArray =
//        [
//            Converter(label: "fahrenheit to celcius", input_Unit: "°F", output_Unit: "°C"),
//            Converter(label: "celcius to fahrenheit", input_Unit: "°C", output_Unit: "°F"),
//            Converter(label: "miles to kilometers", input_Unit: "mi", output_Unit: "km"),
//            Converter(label: "kilometers to miles", input_Unit: "km", output_Unit: "mi")
//        ]
//        
//        for (index, converter) in ConvertersArray.enumerated() {
//            alert.addAction(UIAlertAction(title: converter.label, style: .default, handler: {
//                (alertAction) -> Void in
//                self.current = index
//                self.numbers()
//                
//            }))
//        }
    }
    
    @IBAction func Clear(_ sender: UIButton) {
        inputDisplay.text = nil
        outputDisplay.text = nil
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        inputDisplay.textAlignment = .right
        outputDisplay.textAlignment = .right
        inputDisplay.text?.append(sender.currentTitle!)
        if let text = inputDisplay.text,
            let input = Double(text) {
            
            var output: Double
           
            switch choice {
            case 0:
                output = fToC(input)
            case 1:
                output = cToF(input)
            case 2:
                output = mTok(input)
            case 3:
                output = kTom(input)
            default:
                return
            }

            outputDisplay.text = "\(output)"
            
            
        }
    }
    @IBAction func negative(_ sender: Any) {
        if let text = inputDisplay.text,
            var inputAsDouble = Double(text) {
            inputAsDouble *= -1
            inputDisplay.text = "\(inputAsDouble)"
//            updateResult()
            if let text = inputDisplay.text,
                let input = Double(text) {
                
                var output: Double
                
                switch choice {
                case 0:
                    output = fToC(input)
                case 1:
                    output = cToF(input)
                case 2:
                    output = mTok(input)
                case 3:
                    output = kTom(input)
                default:
                    return
                }
                
                outputDisplay.text = "\(output)"
                
            }
        } else {
            inputDisplay.text = "-"
            outputDisplay.text = "-"
        }
    }
    func updateResult() {
        
        if let text = inputDisplay.text,
            let input = Double(text) {
            
            var output: Double
            
            switch choice {
            case 0:
                output = fToC(input)
            case 1:
                output = cToF(input)
            case 2:
                output = mTok(input)
            case 3:
                output = kTom(input)
            default:
                return
            }
            
            outputDisplay.text = "\(output)"
            
        }
        
    }
    
    func mTok(_ miles: Double) -> Double {
        let total = miles * 1.61
        return  total
    }
    
    func kTom(_ kilometers: Double) -> Double {

        let total = kilometers * 0.62
        return total
    }
    
    
    func fToC(_ ferenheight: Double) -> Double {
        let total = ( ferenheight - 32) * (5/9)
        return total
        
    }
    
    
    func cToF(_ celcius: Double) -> Double {
        let total = celcius * (9/5) + 32
        return total
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterButtonTapped(_ sender: Any) {
     
        let alert = UIAlertController(title: "choose a converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            
            self.whiteText.text = "°F"
            self.blueText.text = "°C"
            self.choice = 0

            if let text = self.inputDisplay.text,
                let input = Double(text) {

                self.result = self.fToC(input)
            }
//            self.outputDisplay.text = "\(self.result)"
            self.updateResult()
        }))
        
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in

            self.whiteText.text = "°C"
            self.blueText.text = "°F"
            
            self.choice = 1
//            if let text = self.inputDisplay.text,
//                let input = Double(text) {
//
//                self.result = self.cToF(input)
//            }
//            self.outputDisplay.text = "\(self.result)"
            
            self.updateResult()
        }))
        
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            
            self.whiteText.text = "mi"
            self.blueText.text = "km"
            
            self.choice = 2
//            if let text = self.inputDisplay.text,
//                let input = Double(text) {
//
//                self.result = self.mTok(input)
//            }
//            self.outputDisplay.text = "\(self.result)"
            
            self.updateResult()
        }))
        
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            
            self.whiteText.text = "km"
            self.blueText.text = "mi"
            
            self.choice = 3
//            if let text = self.inputDisplay.text,
//                let input = Double(text) {
//
//                self.result = self.kTom(input)
//            }
//            self.outputDisplay.text = "\(self.result)"
             self.updateResult()
        }))
        
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


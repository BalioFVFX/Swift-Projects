//
//  HexViewController.swift
//  ColorPicker
//
//  Created by Erik Baliov on 7/27/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class HexViewController: UIViewController {
    //Values from sliders
    var redSliderValue:Float = 0.0
    var greenSliderValue:Float = 0.0
    var blueSliderValue:Float = 0.0
    
    //Sliders outlets
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    
    
    
    //Calculation
    var resultValue:Float = 0.0
    let divideNumber:Float = 16
    var result:Float = 0
    var convertedResult:Int = 0
  
    //RGB And HEX Arrays
    var redValues = [Float]()
    var redHexValues = [Int]()
    var greenValues = [Float] ()
    var greenHexValues = [Int] ()
    var blueValues = [Float] ()
    var blueHexValues = [Int] ()
    var shouldTranslateRed:Bool = false
    var shouldTranslateGreen:Bool = false
    var shouldTranslateBlue:Bool = false
    
    //Hex values stored as String
    var red1:String = ""
    var red2:String = ""
    var green1:String = ""
    var green2:String = ""
    var blue1:String = ""
    var blue2:String = ""
    
    //Background values
    var redBackgroundValue:CGFloat = 0
    var greenBackgroundValue:CGFloat = 0
    var blueBackgroundValue:CGFloat = 0
    
    
    //Text Fields
    @IBOutlet weak var redValueTextField: UITextField!
    @IBOutlet weak var greenValueTextField: UITextField!
    @IBOutlet weak var blueValueTextField: UITextField!
    @IBOutlet weak var resultValueTextField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // myRGB.append(15)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func redSliderDidChange(_ sender: UISlider) {
        redSliderValue = sender.value
        redBackgroundValue = CGFloat(redSliderValue / 255)
        view.backgroundColor = UIColor(red: redBackgroundValue, green: greenBackgroundValue, blue: blueBackgroundValue, alpha: 1.0)
         redValueTextField.text! = String(sender.value)
         redValues.append(redSliderValue)
    
        for item in redValues {
            if(item != 0){
                
                
                result = item / divideNumber
                convertedResult = Int(item) / Int(divideNumber)
                
                
                
                result = result.truncatingRemainder(dividingBy: 1.0)
                
                result = result * 16
                
                redHexValues.append (Int(result))
                
                result = 0
                
                result = Float(convertedResult) / divideNumber
                
                result = result * 16
                
                
                redHexValues.insert(Int(result), at: redHexValues.count - 1)
                
                result = 0
                
            }
            else{
            //    myArray.append(0)
              //  myArray.append(0)
                }
            
                    
                        }

        
            shouldTranslateRed = true
            translateToHex(myArray: &redHexValues)
 
  


    }
    
    @IBAction func greenSliderDidChange(_ sender: UISlider) {
        greenSliderValue = sender.value
        greenBackgroundValue = CGFloat(greenSliderValue / 255)
        view.backgroundColor = UIColor(red: redBackgroundValue, green: greenBackgroundValue, blue: blueBackgroundValue, alpha: 1.0)
        greenValues.append(greenSliderValue)
       
        for item in greenValues {
            if(item != 0){
                
                
                result = item / divideNumber
                convertedResult = Int(item) / Int(divideNumber)
                
                
                
                result = result.truncatingRemainder(dividingBy: 1.0)
                
                result = result * 16
                
                greenHexValues.append (Int(result))
                
                result = 0
                
                result = Float(convertedResult) / divideNumber
                
                result = result * 16
                
                
                greenHexValues.insert(Int(result), at: greenHexValues.count - 1)
                
                result = 0
                
            }
                
            else{
                //    myArray.append(0)
                //  myArray.append(0)
            }
            
            
        }
        shouldTranslateGreen = true
        translateToHex(myArray: &greenHexValues)

        
        
        
    }
    
    @IBAction func blueSliderDidChange(_ sender: UISlider) {
        blueSliderValue = sender.value
        blueBackgroundValue = CGFloat(blueSliderValue / 255)
        view.backgroundColor = UIColor(red: redBackgroundValue, green: greenBackgroundValue, blue: blueBackgroundValue, alpha: 1.0)
        blueValues.append(blueSliderValue)
        print(sender.value)
        
        for item in blueValues {
            if(item != 0){
                
                
                result = item / divideNumber
                convertedResult = Int(item) / Int(divideNumber)
                
                
                
                result = result.truncatingRemainder(dividingBy: 1.0)
                
                result = result * 16
                
                blueHexValues.append (Int(result))
                
                result = 0
                
                result = Float(convertedResult) / divideNumber
                
                result = result * 16
                
                
                blueHexValues.insert(Int(result), at: blueHexValues.count - 1)
                
                result = 0
                
            }
                
            else{
                //    myArray.append(0)
                //  myArray.append(0)
            }
            
            
        }
        shouldTranslateBlue = true
        translateToHex(myArray: &blueHexValues)
        
        
        
        
    }
    
    func translateToHex(myArray: inout[Int]){
        if(shouldTranslateRed == true){
        if(redHexValues.isEmpty == false){
//            for item in myArray {
//                switch true {
//                case item < 1.0:
//                    hexString = "0"
//                case item < 2.0:
//                    hexString = "1"
//                case item < 3.0:
//                    hexString = "2"
//                case item < 4.0:
//                    hexString = "3"
//                case item < 5.0:
//                    hexString = "4"
//                case item < 6.0:
//                    hexString = "5"
//                case item < 7.0:
//                    hexString = "6"
//                case item < 8.0:
//                    hexString = "7"
//                case item < 9.0:
//                    hexString = "8"
//                case item < 10.0:
//                    hexString = "9"
//                case item < 11.0:
//                    hexString = "a"
//                case item < 12.0:
//                    hexString = "b"
//                case item < 13.0:
//                    hexString = "c"
//                case item < 14.0:
//                    hexString = "d"
//                case item < 15.0:
//                    hexString = "e"
//                case item < 16.0:
//                    hexString = "f"
//                default:
//                    break
//                }
//            }
        
     
         
            for var i in (0...1)
            {
           
                if(redHexValues[i] == 0){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])
                }
                if(myArray[i] == 1){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])
                }
                if(myArray[i] == 2){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])                }
                if(myArray[i] == 3){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])
                }
                if(myArray[i] == 4){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])
                }
                if(myArray[0] == 5){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])
                }
                if(myArray[i] == 6){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])
                }
                if(myArray[i] == 7){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])
                }
                if(myArray[i] == 8){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])
                }
                if(myArray[i] == 9){
                    red1 = String(redHexValues[0])
                    red2 = String(redHexValues[1])
                }
            }
            if(redHexValues[0] == 10){
                red1 = "a"
            }
            if(redHexValues[1] == 10){
                red2 = "a"
            }
            if(redHexValues[0] == 11){
                red1 = "b"
            }
            if(redHexValues[1] == 11){
                red2 = "b"
            }
            if(redHexValues[0] == 12){
                red1 = "c"
            }
            if(redHexValues[1] == 12){
                red2 = "c"
            }
            if(redHexValues[0] == 13){
                red1 = "d"
            }
            if(redHexValues[1] == 13){
                red2 = "d"
            }
            if(redHexValues[0] == 14){
                red1 = "e"
            }
            if(redHexValues[1] == 14){
                red2 = "e"
            }
            if(redHexValues[0] == 15){
                red1 = "f"
            }
            if(redHexValues[1] == 15){
                red2 = "f"
            }
            
         
        
         //  resultValueTextField!.text! = "#" + red1 + red2 + green1 + green2
            redValueTextField.text! = red1 + red2
           red1 = ""
           red2 = ""
           redHexValues.removeAll()
           redValues.removeAll()
            
        }
            shouldTranslateRed = false
        }
        
        if(shouldTranslateGreen == true){
            
            if(greenHexValues.isEmpty == false){
                
                for var i in (0...1)
                {
                    
                    if(greenHexValues[i] == 0){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    if(greenHexValues[i] == 1){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    if(greenHexValues[i] == 2){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    
                    if(greenHexValues[i] == 3){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    if(greenHexValues[i] == 4){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    if(greenHexValues[0] == 5){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    if(greenHexValues[i] == 6){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    if(greenHexValues[i] == 7){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    if(greenHexValues[i] == 8){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    if(greenHexValues[i] == 9){
                        green1 = String(greenHexValues[0])
                        green2 = String(greenHexValues[1])
                    }
                    
                }
                if(greenHexValues[0] == 10){
                    green1 = "a"
                }
                if(greenHexValues[1] == 10){
                    green2 = "a"
                }
                if(greenHexValues[0] == 11){
                    green1 = "b"
                }
                if(greenHexValues[1] == 11){
                    green2 = "b"
                }
                if(greenHexValues[0] == 12){
                    green1 = "c"
                }
                if(greenHexValues[1] == 12){
                    green2 = "c"
                }
                if(greenHexValues[0] == 13){
                    green1 = "d"
                }
                if(greenHexValues[1] == 13){
                    green2 = "d"
                }
                if(greenHexValues[0] == 14){
                    green1 = "e"
                }
                if(greenHexValues[1] == 14){
                    green2 = "e"
                }
                if(greenHexValues[0] == 15){
                    green1 = "f"
                }
                if(greenHexValues[1] == 15){
                    green2 = "f"
                }
                
                
               // resultValueTextField.text! = "#" + red1
                greenValueTextField!.text = green1 + green2
                green1 = ""
                green2 = ""
                greenHexValues.removeAll()
                greenValues.removeAll()
                
                
            }
            shouldTranslateGreen = false
            
        }
        
        if(shouldTranslateBlue == true){
            
            if(blueHexValues.isEmpty == false){
                
                for var i in (0...1)
                {
                    
                    if(blueHexValues[i] == 0){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    if(blueHexValues[i] == 1){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    if(blueHexValues[i] == 2){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    
                    if(blueHexValues[i] == 3){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    if(blueHexValues[i] == 4){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    if(blueHexValues[0] == 5){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    if(blueHexValues[i] == 6){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    if(blueHexValues[i] == 7){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    if(blueHexValues[i] == 8){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    if(blueHexValues[i] == 9){
                        blue1 = String(blueHexValues[0])
                        blue2 = String(blueHexValues[1])
                    }
                    
                }
                if(blueHexValues[0] == 10){
                    blue1 = "a"
                }
                if(blueHexValues[1] == 10){
                    blue2 = "a"
                }
                if(blueHexValues[0] == 11){
                    blue1 = "b"
                }
                if(blueHexValues[1] == 11){
                    blue2 = "b"
                }
                if(blueHexValues[0] == 12){
                    blue1 = "c"
                }
                if(blueHexValues[1] == 12){
                    blue2 = "c"
                }
                if(blueHexValues[0] == 13){
                    blue1 = "d"
                }
                if(blueHexValues[1] == 13){
                    blue2 = "d"
                }
                if(blueHexValues[0] == 14){
                    blue1 = "e"
                }
                if(blueHexValues[1] == 14){
                    blue2 = "e"
                }
                if(blueHexValues[0] == 15){
                    blue1 = "f"
                }
                if(blueHexValues[1] == 15){
                    blue2 = "f"
                }
                
                
                // resultValueTextField.text! = "#" + red1
                blueValueTextField!.text = blue1 + blue2
                blue1 = ""
                blue2 = ""
                blueHexValues.removeAll()
                blueValues.removeAll()
                
                
            }
            shouldTranslateBlue = false
            
        }
        
        
        resultValueTextField.text! = "#" + redValueTextField.text! + greenValueTextField.text! + blueValueTextField.text!
     
    }

    @IBAction func myButtonTapped(_ sender: UIButton) {
        DataProvider.Red = self.redBackgroundValue * 255
        DataProvider.Green = self.greenBackgroundValue * 255
        DataProvider.Blue = self.blueBackgroundValue * 255
        DataProvider.ShouldUpdateBackground = true
        self.tabBarController?.selectedIndex = 0
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        redValues.removeAll()
        greenValues.removeAll()
        blueValues.removeAll()
        redHexValues.removeAll()
        greenHexValues.removeAll()
        blueHexValues.removeAll()
        
        red1 = ""
        red2 = ""
        green1 = ""
        green2 = ""
        blue1 = ""
        blue2 = ""
        
        redSliderValue = 0
        greenSliderValue = 0
        blueSliderValue = 0
        
        redValueTextField.text = "00"
        greenValueTextField.text = "00"
        blueValueTextField.text = "00"
        resultValueTextField.text = "#000000"
        
        redSliderOutlet.value = 0
        greenSliderOutlet.value = 0
        blueSliderOutlet.value = 0
        
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
    }


}

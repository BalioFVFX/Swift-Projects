//
//  HexViewController.swift
//  ColorPicker
//
//  Created by Erik Baliov on 7/27/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class HexViewController: UIViewController {
    //Values
    var redSliderValue:Float = 0.0
    var greenSliderValue:Float = 0.0
    var blueSliderValue:Float = 0.0
    var resultValue:Float = 0.0
    let divideNumber:Float = 16
    var result:Float = 0
    var convertedResult:Int = 0
    var hexString: String = "#"
    var myArray = [Int]()
    
    var myRGB = [Float]()
    var myGreenValues = [Float] ()
    var myHexGreenValues = [Int] ()
    
    var testarr = [Float] ()
    var testarr2 = [Float] ()
    
    var redToHex = [Float] ()
    
    var red1:String = ""
    var red2:String = ""
    var green1:String = ""
    var green2:String = ""
    
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
         redValueTextField.text! = String(sender.value)
         myRGB.append(redSliderValue)
    
        for item in myRGB {
            if(item != 0){
                
                
                result = item / divideNumber
                convertedResult = Int(item) / Int(divideNumber)
                
                
                
                result = result.truncatingRemainder(dividingBy: 1.0)
                
                result = result * 16
                
                myArray.append (Int(result))
                
                result = 0
                
                result = Float(convertedResult) / divideNumber
                
                result = result * 16
                
                
                myArray.insert(Int(result), at: myArray.count - 1)
                
                result = 0
                
            }
                
            else{
            //    myArray.append(0)
              //  myArray.append(0)
            }
            
                    
                        }
translateToHex(myArray: &myArray)
 
  


    }
    
    @IBAction func greenSliderDidChange(_ sender: UISlider) {
        greenSliderValue = sender.value
        greenValueTextField.text! = String(sender.value)
        myGreenValues.append(greenSliderValue)
        
        for item in myGreenValues {
            if(item != 0){
                
                
                result = item / divideNumber
                convertedResult = Int(item) / Int(divideNumber)
                
                
                
                result = result.truncatingRemainder(dividingBy: 1.0)
                
                result = result * 16
                
                myHexGreenValues.append (Int(result))
                
                result = 0
                
                result = Float(convertedResult) / divideNumber
                
                result = result * 16
                
                
                myHexGreenValues.insert(Int(result), at: myHexGreenValues.count - 1)
                
                result = 0
                
            }
                
            else{
                //    myArray.append(0)
                //  myArray.append(0)
            }
            
            
        }
        
         if(myHexGreenValues.isEmpty == false){
        
        for var i in (0...1)
        {
            
           
            
            if(myHexGreenValues[i] == 0){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            if(myHexGreenValues[i] == 1){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            if(myHexGreenValues[i] == 2){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            
            if(myHexGreenValues[i] == 3){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            if(myHexGreenValues[i] == 4){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            if(myHexGreenValues[0] == 5){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            if(myHexGreenValues[i] == 6){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            if(myHexGreenValues[i] == 7){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            if(myHexGreenValues[i] == 8){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            if(myHexGreenValues[i] == 9){
                green1 = String(myHexGreenValues[0])
                green2 = String(myHexGreenValues[1])
            }
            
        }
        if(myHexGreenValues[0] == 10){
            green1 = "a"
        }
        if(myHexGreenValues[1] == 10){
            green2 = "a"
        }
        if(myHexGreenValues[0] == 11){
            green1 = "b"
        }
        if(myHexGreenValues[1] == 11){
            green2 = "b"
        }
        if(myHexGreenValues[0] == 12){
            green1 = "c"
        }
        if(myHexGreenValues[1] == 12){
            green2 = "c"
        }
        if(myHexGreenValues[0] == 13){
            green1 = "d"
        }
        if(myHexGreenValues[1] == 13){
            green2 = "d"
        }
        if(myHexGreenValues[0] == 14){
            green1 = "e"
        }
        if(myHexGreenValues[1] == 14){
            green2 = "e"
        }
        if(myHexGreenValues[0] == 15){
            green1 = "f"
        }
        if(myHexGreenValues[1] == 15){
            green2 = "f"
        }
        
        
            
        blueValueTextField!.text = green1 + green2
        green1 = ""
        green2 = ""
        myHexGreenValues.removeAll()
        myGreenValues.removeAll()
    
        }
        
        
        
    }
    
    @IBAction func blueSliderDidChange(_ sender: UISlider) {
    }
    
    
    func translateGreenToHex(greenArray: inout[Int]){
        
        
        
    }
    
    func translateToHex(myArray: inout[Int]){
        if(myArray.isEmpty == false){
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
            if(hexString.characters.count > 3){
                hexString = hexString + ""
            }
     
         
            for var i in (0...1)
            {
            print(myArray[i])
                if(myArray[i] == 0){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 1){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 2){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])                }
                if(myArray[i] == 3){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 4){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[0] == 5){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 6){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 7){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 8){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 9){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
            }
            if(myArray[0] == 10){
                red1 = "a"
            }
            if(myArray[1] == 10){
                red2 = "a"
            }
            if(myArray[0] == 11){
                red1 = "b"
            }
            if(myArray[1] == 11){
                red2 = "b"
            }
            if(myArray[0] == 12){
                red1 = "c"
            }
            if(myArray[1] == 12){
                red2 = "c"
            }
            if(myArray[0] == 13){
                red1 = "d"
            }
            if(myArray[1] == 13){
                red2 = "d"
            }
            if(myArray[0] == 14){
                red1 = "e"
            }
            if(myArray[1] == 14){
                red2 = "e"
            }
            if(myArray[0] == 15){
                red1 = "f"
            }
            if(myArray[1] == 15){
                red2 = "f"
            }
            
         
        
           resultValueTextField!.text = red1 + red2
           red1 = ""
           red2 = ""
           myArray.removeAll()
           myRGB.removeAll()
            
        }
       
     
    }

    @IBAction func myButtonTapped(_ sender: UIButton) {
      
      hexString.removeAll()
        greenValueTextField.text! = ""
        
    }



}

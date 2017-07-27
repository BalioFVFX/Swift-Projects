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
    
    var testarr = [Float] ()
    var testarr2 = [Float] ()
    
    var redToHex = [Float] ()
    
    var red1:String = ""
    var red2:String = ""
    
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
      //  translateToHex(myArray)
    }
    
    @IBAction func blueSliderDidChange(_ sender: UISlider) {
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
     
         
            for var i in (0..<myArray.count)
            {
            print(myArray[i])
                
                if(myArray[i] == 1){
                    red1 = "1"
                    red2 = "1"
                }
                if(myArray[i] == 2){
                    red1 = "2"
                    red2 = "2"
                }
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
                if(myArray[i] == 10){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 11){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 12){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 13){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 14){
                    red1 = String(myArray[0])
                    red2 = String(myArray[1])
                }
                if(myArray[i] == 15){
                    red1 = "f"
                    red2 = "f"
                }
                
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

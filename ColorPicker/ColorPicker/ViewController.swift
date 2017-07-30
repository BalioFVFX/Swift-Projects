//
//  ViewController.swift
//  ColorPicker
//
//  Created by Erik Baliov on 7/25/17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var redSliderValue:CGFloat = 0.0
    var greenSliderValue:CGFloat = 0.0
    var blueSliderValue:CGFloat = 0.0
    var alphaSliderValue:CGFloat = 0.0
    
    
    //Text Fields
    @IBOutlet weak var redValueTextField: UITextField!
    @IBOutlet weak var greenValueTextField: UITextField!
    @IBOutlet weak var blueValueTextField: UITextField!
    @IBOutlet weak var alphaValueTextField: UITextField!
    
    //Sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(DataProvider.ShouldUpdateBackground == true){
            redSlider.value = Float(DataProvider.Red)
            greenSlider.value = Float(DataProvider.Green)
            blueSlider.value = Float(DataProvider.Blue)
            alphaSlider.value = 1.0
            
            redSliderValue = DataProvider.Red
            greenSliderValue = DataProvider.Green
            blueSliderValue = DataProvider.Blue
            alphaSliderValue = 1.0
            
            view.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: alphaSliderValue)
              redValueTextField.text! = DataProvider.Red.description
              greenValueTextField.text! = DataProvider.Green.description
              blueValueTextField.text! = DataProvider.Blue.description
              alphaValueTextField.text! = "1"
            
            DataProvider.ShouldUpdateBackground = false
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    

    
    
    @IBAction func redSliderDidChange(_ sender: UISlider) {
        redSliderValue = CGFloat(sender.value / 255)
        redValueTextField.text! = String(sender.value)
        view.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: alphaSliderValue)
    }

    
    @IBAction func greenSliderDidChange(_ sender: UISlider) {
        greenSliderValue = CGFloat(sender.value / 255)
         greenValueTextField.text! = String(sender.value)
        view.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: alphaSliderValue)
    }
    
    @IBAction func blueSliderDidChange(_ sender: UISlider) {
         blueSliderValue = CGFloat(sender.value / 255)
         blueValueTextField.text! = String(sender.value)
        view.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: alphaSliderValue)
    }
    
    @IBAction func alphaSliderDidChange(_ sender: UISlider) {
        alphaSliderValue = CGFloat(sender.value / 255)
        alphaValueTextField.text! = String(sender.value)
        view.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: alphaSliderValue)
    }
    
}


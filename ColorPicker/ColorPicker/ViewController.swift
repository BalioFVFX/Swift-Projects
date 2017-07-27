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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    

    
    
    @IBAction func redSliderDidChange(_ sender: UISlider) {
        redSliderValue = CGFloat(sender.value)
        redValueTextField.text! = String(sender.value * 255)
        view.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: alphaSliderValue)
        
        print(sender.value * 255)
    }

    
    @IBAction func greenSliderDidChange(_ sender: UISlider) {
        greenSliderValue = CGFloat(sender.value)
         greenValueTextField.text! = String(sender.value * 255)
        view.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: alphaSliderValue)
    }
    
    @IBAction func blueSliderDidChange(_ sender: UISlider) {
         blueSliderValue = CGFloat(sender.value)
         blueValueTextField.text! = String(sender.value * 255)
        view.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: alphaSliderValue)
    }
    
    @IBAction func alphaSliderDidChange(_ sender: UISlider) {
        alphaSliderValue = CGFloat(sender.value)
        alphaValueTextField.text! = String(sender.value * 250)
        view.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: alphaSliderValue)
    }
    
}


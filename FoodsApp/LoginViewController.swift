//
//  LoginViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 22.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginRegisterSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    
    var isLoginSelected:Bool = false
    var isRegisterSelected:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isLoginSelected = true
        isRegisterSelected = false
        
        
        let nameForTextField = UserDefaults.standard.string(forKey: "savedNameTextField")
        let isMyRememberSwitchOn = UserDefaults.standard.bool(forKey: "rememberMeSwitchIsOn")
        let hasLoggedout = UserDefaults.standard.bool(forKey: "hasLoggedoutBool")
        LocalDataManager.user.name = nameForTextField!
        
        
        
        if(isMyRememberSwitchOn == true){
            self.nameTextField.text = nameForTextField
            self.rememberMeSwitch.isOn = isMyRememberSwitchOn
          
            if(hasLoggedout == false){
                
                UserDefaults.standard.set(false, forKey: "hasLoggedoutBool")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            }
        }
            
        else{
            self.nameTextField.text = ""
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginRegisterSegmentedControlTapped(_ sender: UISegmentedControl) {
        switch loginRegisterSegmentedControl.selectedSegmentIndex {
        case 0:
            loginButton.setTitle("Login", for: .normal)
            isLoginSelected = true
            isRegisterSelected = false
        case 1:
            loginButton.setTitle("Register", for: .normal)
            isLoginSelected = false
            isRegisterSelected = true
        default:
            break
        }
    }
    
    
    
    
    private func returnKeyTapped(textField: UITextField){
        switch textField {
        case self.nameTextField:
            self.passwordTextField.becomeFirstResponder()
        case self.passwordTextField:
            self.passwordTextField.resignFirstResponder()
        default:
            break
        }
    }
    
    @IBAction func textFieldsPrimariesActionsTriggered(_ sender: UITextField) {
        self.returnKeyTapped(textField: sender)
    }
    
    
    
    @IBAction func rememberMeSwitchTapped(_ sender: UISwitch) {
        
    }
    
    
    
    
    // MARK: - LOGIN
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        SVProgressHUD.show()
        
        
        //Error handle
        guard let name = nameTextField.text ,nameTextField.text?.characters.count ?? 0 > 0 else{
            nameTextField.backgroundColor = UIColor.red
            SVProgressHUD.showError(withStatus: "Please fill in the name field")
            SVProgressHUD.dismiss(withDelay:0.7)
            return
        }
        
        
        UserDefaults.standard.set(self.nameTextField.text, forKey: "savedNameTextField")
        UserDefaults.standard.set(rememberMeSwitch.isOn, forKey: "rememberMeSwitchIsOn")
        
        
        nameTextField.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        guard let password = passwordTextField.text, passwordTextField.text?.characters.count ?? 0 > 0 else{
            passwordTextField.backgroundColor = UIColor.red
            SVProgressHUD.showError(withStatus: "Please fill in the password field")
            SVProgressHUD.dismiss(withDelay:0.7)
            return
        }
        
        passwordTextField.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //Prepare for sending the data
        LocalDataManager.user.name = name
        
        
        
        // MARK: - LOGIN
        
        if(isLoginSelected == true){
            RequestManager.loginUserRequest(username: name, password: password, completion: { (sucess, statusMessage) in
                
                //ERROR HANDLE
                
                DispatchQueue.main.async{
                    
                    guard sucess == true, statusMessage == nil else{
                        SVProgressHUD.showError(withStatus: statusMessage)
                        SVProgressHUD.dismiss(withDelay:0.7)
                        return
                    }
                    
                    // SUCESS
                    
                    SVProgressHUD.showSuccess(withStatus: "Successfully Logged-In")
                    SVProgressHUD.dismiss(withDelay:0.5)
                    
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
                UserDefaults.standard.set(false, forKey: "hasLoggedoutBool")
            })
        }
        
        
        
        // MARK: - REGISTER
        
        if(isRegisterSelected == true){
            RequestManager.canRegisterRequest(username: name, completion: { (sucess, statusMessage) in
                
                guard sucess == true && statusMessage == nil else{
                    SVProgressHUD.showError(withStatus: statusMessage)
                    SVProgressHUD.dismiss(withDelay:1.5)
                    return
                }
                
                RequestManager.registerUserRequest(username: name, password: password) { (sucess, statusMessage) in
                    DispatchQueue.main.async {
                        
                        // ERROR HANDLE
                        
                        guard sucess == true && statusMessage == nil else{
                            SVProgressHUD.showError(withStatus: statusMessage)
                            SVProgressHUD.dismiss(withDelay:0.7)
                            return
                        }
                        
                        // SUCESS
                        
                        SVProgressHUD.showSuccess(withStatus: "Successfully Registered")
                        SVProgressHUD.dismiss(withDelay:0.5)
                        
                        
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        
                    }
                    UserDefaults.standard.set(false, forKey: "hasLoggedoutBool")
                }
                
                
            })
            
            
            
            
        }
        
        
        
    }
    
}

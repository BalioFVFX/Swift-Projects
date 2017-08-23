//
//  AddRecipeViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 23.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import SVProgressHUD

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var recipeDetailsTextView: UITextView!
    @IBOutlet weak var recipeTimeToCookTextField: UITextField!
    @IBOutlet weak var recipeAddButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func recipeAddButtonTapped(_ sender: UIButton) {
        SVProgressHUD.show()
       
        //Error handle
        guard let recipeName = recipeNameTextField.text, recipeNameTextField.text?.characters.count ?? 0 > 0 else{
            recipeNameTextField.backgroundColor = UIColor.red
            SVProgressHUD.showError(withStatus: "Please fill in the recipe name field")
            return
        }
        
        recipeNameTextField.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        guard let recipeDetails = recipeDetailsTextView.text, recipeDetailsTextView.text.characters.count ?? 0 > 0 else{
            recipeDetailsTextView.backgroundColor = UIColor.red
            SVProgressHUD.showError(withStatus: "Please fill in the recipe detials field")
            return
        }
        
        recipeDetailsTextView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        guard let recipeTimeToCook = recipeTimeToCookTextField.text, recipeTimeToCookTextField.text?.characters.count ?? 0 > 0 else{
            recipeTimeToCookTextField.backgroundColor = UIColor.red
            SVProgressHUD.showError(withStatus: "Please fill in the time to cook field")
            return
        }
       
        recipeTimeToCookTextField.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //Add the data
        
        RequestManager.addRecipeRequest(user: LocalDataManager.user, recipeName: recipeName, recipeDetails: recipeDetails, recipeTimeToCook: recipeTimeToCook) { (sucess, statusMessage) in
            
            DispatchQueue.main.async{
            
            guard sucess == true && statusMessage == nil else{
                SVProgressHUD.showError(withStatus: statusMessage)
                return
            }
           
                // Clear the textfields & views when recipe is added sucessfuly
            self.recipeNameTextField.text = ""
            self.recipeDetailsTextView.text = ""
            self.recipeTimeToCookTextField.text = ""
            
            SVProgressHUD.showSuccess(withStatus: "Recipe added sucessfuly")
            }
        }
        
    }
    
}

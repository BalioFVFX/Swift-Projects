//
//  FoodDetailsViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 24.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class FoodDetailsViewController: UIViewController {

    
    var currentCellItem = Foods()
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameTextLabel: UILabel!
    @IBOutlet weak var foodTimeToCookTextLabel: UILabel!
    @IBOutlet weak var foodDetailsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocalDataManager.user.comments.removeAll()
        LocalDataManager.currentRecipeComments.removeAll()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.foodImageView.image = UIImage(named: currentCellItem.recipeImageName)
        self.foodNameTextLabel.text = currentCellItem.recipeName
        self.foodTimeToCookTextLabel.text = currentCellItem.recipeDuration
        self.foodDetailsTextView.text = currentCellItem.recipeDetails

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCommentsButtonTapped(_ sender: UIButton) {
        LocalDataManager.currentFood = currentCellItem
        self.performSegue(withIdentifier: "commentsSegue", sender: nil)
    }



}

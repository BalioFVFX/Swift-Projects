//
//  FoodsTableViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 22.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import SVProgressHUD

class FoodsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LocalDataManager.myFoods.removeAll()

        RequestManager.getRecipesRequest { (sucess, statusMessage) in
            DispatchQueue.main.async {
                
                guard sucess == true && statusMessage == nil else{
                    SVProgressHUD.showError(withStatus: statusMessage)
                    return
                }
                self.tableView.reloadData()
                SVProgressHUD.showSuccess(withStatus: "Sucessfuly Loaded Data")
            }
        }
     
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocalDataManager.myFoods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodsTableViewCell", for: indexPath) as! FoodsTableViewCell
    
        cell.foodItemRecipeNameLabel.text = LocalDataManager.myFoods[indexPath.row].recipeName
        cell.foodItemRecipeDurationLabel.text = LocalDataManager.myFoods[indexPath.row].recipeTimeToCook
        cell.foodItemImageView.image = UIImage(named: LocalDataManager.myFoods[indexPath.row].recipeImageName)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addFoodBarButtonTapped(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addFoodSegue", sender: nil)
    }
  
}

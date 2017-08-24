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
        RequestManager.getRecipesRequest { (sucess, statusMessage) in
            DispatchQueue.main.async {
                
                guard sucess == true && statusMessage == nil else{
                    SVProgressHUD.showError(withStatus: statusMessage)
                    SVProgressHUD.dismiss(withDelay:0.7)
                    return
                }
                self.tableView.reloadData()
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
        print(LocalDataManager.myFoods[7].recipeName)
    }
    
    @IBAction func addFoodBarButtonTapped(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addFoodSegue", sender: nil)
    }
  
    // MARK: - SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else{
            return
        }
        
        switch segueIdentifier{
            case "foodDetailsSegue":
            
                guard let cell = sender as? UITableViewCell else{
                    assert(false)
                    return
            }
            
                guard let indexPath = self.tableView.indexPath(for: cell) else{
                    return
            }
            (segue.destination as! FoodDetailsViewController).currentCellItem = LocalDataManager.myFoods[indexPath.row]
            
        default:
            break
            
        }
        
    }
    
    
}

extension SVProgressHUD{
    
}

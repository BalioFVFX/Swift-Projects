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
    
    var openScreenForFirstTime:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        
      RequestManager.GETUserImageRequest(username: LocalDataManager.user.name) { (success, statusMessage) in
        
        }
        
        openScreenForFirstTime = true
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        LocalDataManager.currentRecipeComments.removeAll()
//        LocalDataManager.user.comments.removeAll()
//        
            RequestManager.GETUsersUsernamesRequest { (success, statusMessage) in
                guard success == true && statusMessage == nil else{
                    return
                }
        
       
            
            RequestManager.GETMyRecipesRequest { (success, statusMessage) in
               
                    guard success == true, statusMessage == nil else{
                        SVProgressHUD.showError(withStatus: statusMessage)
                        SVProgressHUD.dismiss(withDelay: 0.7)
                        return
                    }
                    
                
            }
                
                RequestManager.GETAllRecipesRequest(completion: { (success, statusMessage) in
                     DispatchQueue.main.async{
                    guard success == true, statusMessage == nil else{
                        SVProgressHUD.showError(withStatus: statusMessage)
                        SVProgressHUD.dismiss(withDelay: 0.7)
                        return
                    }
                    
                    self.tableView.reloadData()
                    if(self.openScreenForFirstTime == true){
                    SVProgressHUD.showSuccess(withStatus: "Recipes loaded successfully")
                    SVProgressHUD.dismiss(withDelay: 0.5)
                    self.openScreenForFirstTime = false
                    }
                    else{
                        SVProgressHUD.showSuccess(withStatus: "Recipes updated")
                        SVProgressHUD.dismiss(withDelay: 0.4)
                        }
                    }
                })
                
        }
        
        
                //print(LocalDataManager.users[0].name)

        
        
        //Get my recipes
//        RequestManager.getMyRecipesRequest(user: LocalDataManager.user) { (sucess, statusMessage) in
//            
//            guard sucess == true && statusMessage == nil else{
//                SVProgressHUD.showError(withStatus: statusMessage)
//                SVProgressHUD.dismiss(withDelay:0.7)
//                return
//            }
//            
//            // Get all recipes
//            RequestManager.getRecipesRequest { (sucess, statusMessage) in
//                
//                if(self.openScreenForFirstTime == true){
//                    //RequestManager.GetCommentsRequest(user: LocalDataManager.user.name, key: <#T##String#>, completion: <#T##(Bool, String?) -> ()#>)
//                }
//                
//                DispatchQueue.main.sync{
//                    guard sucess == true && statusMessage == nil else{
//                        SVProgressHUD.showError(withStatus: statusMessage)
//                        SVProgressHUD.dismiss(withDelay:0.7)
//                        return
//                    }
//                    if(self.openScreenForFirstTime == true){
//                        SVProgressHUD.showSuccess(withStatus: "Data downloaded successfully")
//                        SVProgressHUD.dismiss(withDelay:0.7)
//                        self.openScreenForFirstTime = false
//                    }
//                    SVProgressHUD.dismiss(withDelay:0.7)
//                    self.tableView.reloadData()
//                }
//            }
//            
//            
//        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return LocalDataManager.myFoods.count
        default:
            return LocalDataManager.allFoods.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        switch section {
        case 0:
            return "My recipes"
        default:
            return "All recipes"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodsTableViewCell", for: indexPath) as! FoodsTableViewCell
        
        if(indexPath.section == 0){
            cell.foodItemRecipeNameLabel.text = LocalDataManager.myFoods[indexPath.row].recipeName
            cell.foodItemRecipeDurationLabel.text = LocalDataManager.myFoods[indexPath.row].recipeDuration
            cell.foodItemImageView.image = UIImage(named: "food.png")
        }
        
        if(indexPath.section == 1){
            cell.foodItemRecipeNameLabel.text = LocalDataManager.allFoods[indexPath.row].recipeName
            cell.foodItemRecipeDurationLabel.text = LocalDataManager.allFoods[indexPath.row].recipeDuration
            cell.foodItemImageView.image = UIImage(named: "food.png")
            
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        // print(LocalDataManager.myFoods[7].recipeName)
    }
    
    
    @IBAction func LogoutBarButtonTapped(_ sender: UIBarButtonItem) {

        self.performSegue(withIdentifier: "profileSegue", sender: nil)
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
            if(indexPath.section == 0){
                (segue.destination as! FoodDetailsViewController).currentCellItem = LocalDataManager.myFoods[indexPath.row]
            }
            if(indexPath.section == 1){
                (segue.destination as! FoodDetailsViewController).currentCellItem = LocalDataManager.allFoods[indexPath.row]
            }
            
            print(indexPath.row)
            
        default:
            break
            
        }
        
    }
    
    
}


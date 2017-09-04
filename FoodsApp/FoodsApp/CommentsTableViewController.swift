//
//  CommentsTableViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 26.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import SVProgressHUD

class CommentsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        
        
        RequestManager.GETTheCommentsOfTheSelectedRecipeRequest(recipeKey: LocalDataManager.currentFood.recipeKey) { (success, statusMessage) in
            DispatchQueue.main.async {
                
            guard success == true && statusMessage == nil else{
                SVProgressHUD.showError(withStatus: statusMessage)
                SVProgressHUD.dismiss(withDelay: 0.7)
                return
            }
            
            SVProgressHUD.showSuccess(withStatus: "Comments loaded")
            SVProgressHUD.dismiss(withDelay: 0.5)
            self.tableView.reloadData()
            }
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LocalDataManager.currentRecipeComments.removeAll()
        LocalDataManager.user.comments.removeAll()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section{
        case 0:
            return LocalDataManager.user.comments.count
        default:
             return LocalDataManager.currentRecipeComments.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        switch section {
        case 0:
            return "My comments"
        default:
            return "All comments"
        }
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as! CommentsTableViewCell

        if(indexPath.section == 0){
            cell.commentNameLabel.text = "Name: " + LocalDataManager.user.comments[indexPath.row]["User"]!
            cell.commentLabel.text = LocalDataManager.user.comments[indexPath.row]["Comment"]!
            cell.commentImageView.image = UIImage(named: LocalDataManager.user.comments[indexPath.row]["Image"]!)
            cell.commentDateLabel.text = LocalDataManager.user.comments[indexPath.row]["Date"]!
           
        }
        
        if(indexPath.section == 1){
        
        cell.commentNameLabel.text = "Name: " + LocalDataManager.currentRecipeComments[indexPath.row].user
        cell.commentLabel.text = LocalDataManager.currentRecipeComments[indexPath.row].comment
        cell.commentImageView.image = UIImage(named:LocalDataManager.currentRecipeComments[indexPath.row].imageName)
        cell.commentDateLabel.text = LocalDataManager.currentRecipeComments[indexPath.row].date
        
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addCommentBarButtonTapped(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addCommentSegue", sender: nil)
      
    }
    

    // MARK: - SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else{
            return
        }
        
        switch segueIdentifier{
        case "commentDetailsSegue":
            
            guard let cell = sender as? UITableViewCell else{
                assert(false)
                return
            }
            
            guard let indexPath = self.tableView.indexPath(for: cell) else{
                return
            }
            
//            if(indexPath.section == 0){
//                (segue.destination as! FoodDetailsViewController).currentCellItem = LocalDataManager.myFoods[indexPath.row]
//            }
//            if(indexPath.section == 1){
//                (segue.destination as! FoodDetailsViewController).currentCellItem = LocalDataManager.allFoods[indexPath.row]
//            }
            if(indexPath.section == 0){
                (segue.destination as! CommentDetailsViewController).currentCell = indexPath.row
                (segue.destination as! CommentDetailsViewController).currentSection = indexPath.section
            }
            
            if(indexPath.section == 1){
            
            (segue.destination as! CommentDetailsViewController).currentCell = indexPath.row
            }
            print(indexPath.row)
          
        default:
            break
            
        }
        
    }
}

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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        RequestManager.GetCommentsRequest(user: LocalDataManager.currentFood.recipeUser, key: LocalDataManager.currentFood.recipeKey) { (sucess, statusMessage) in
            
            DispatchQueue.main.sync{
            guard sucess == true && statusMessage == nil else{
                SVProgressHUD.showError(withStatus: statusMessage)
                SVProgressHUD.dismiss(withDelay:0.7)
                return
            }
            
           
                self.tableView.reloadData()
                SVProgressHUD.showSuccess(withStatus: "Comments loaded")
                SVProgressHUD.dismiss(withDelay:0.7)
            }
        }
        print(LocalDataManager.currentFood.recipeUser)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return LocalDataManager.currentFood.comments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as! CommentsTableViewCell

        cell.commentNameLabel.text = "Name: " + LocalDataManager.currentFood.commentNames[indexPath.row]
        cell.commentLabel.text = LocalDataManager.currentFood.comments[indexPath.row]
        cell.commentImageView.image = UIImage(named: "food.png")
        cell.commentDateLabel.text = LocalDataManager.currentFood.datesOfComments[indexPath.row]

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
            
            (segue.destination as! CommentDetailsViewController)
            
            print(indexPath.row)
            
        default:
            break
            
        }
        
    }
}

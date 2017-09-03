//
//  CommentDetailsViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 28.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import SVProgressHUD

class CommentDetailsViewController: UIViewController {

    var currentCell:Int = 0
    var currentSection:Int = 1
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var editCommentButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTextView.isEditable = false
        editCommentButton.isHidden = true
        
        //Wrong informaiton about the first section of my comments
        if(currentSection == 0){
            self.nameLabel.text = "Name: " + LocalDataManager.user.comments[currentCell]["User"]!
            self.dateLabel.text = "Date: " + LocalDataManager.user.comments[currentCell]["Date"]!
            self.commentTextView.text = LocalDataManager.user.comments[currentCell]["Comment"]!
            commentTextView.isEditable = true
            editCommentButton.isHidden = false

        }
        
        
        if(currentSection == 1){
        
        self.nameLabel.text = "Name: " + LocalDataManager.currentRecipeComments[currentCell].user
        self.dateLabel.text = "Date: " + LocalDataManager.currentRecipeComments[currentCell].date
        self.commentTextView.text = LocalDataManager.currentRecipeComments[currentCell].comment
        
            if(LocalDataManager.currentRecipeComments[currentCell].user == LocalDataManager.user.name){
                commentTextView.isEditable = true
                editCommentButton.isHidden = false
            }

        
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func editCommentButtonTapped(_ sender: UIButton) {
        
     
      
        let date = Date()
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        let currentDate = String(day) + "." + String(month) + "." + String(year)
        
        RequestManager.PATCHEditCommentRequest(recipeKey: LocalDataManager.user.comments[currentCell]["RecipeKey"]!, commentKey: LocalDataManager.user.comments[currentCell]["CommentKey"]!, comment: commentTextView.text!, date: currentDate) { (success, statusMessage) in
            DispatchQueue.main.async{
                guard success == true && statusMessage == nil else{
                    SVProgressHUD.showError(withStatus: statusMessage)
                    SVProgressHUD.dismiss(withDelay: 0.7)
                    return
                }
                SVProgressHUD.showSuccess(withStatus: "Comment edited")
                SVProgressHUD.dismiss(withDelay: 0.5)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

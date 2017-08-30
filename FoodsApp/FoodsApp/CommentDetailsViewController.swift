//
//  CommentDetailsViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 28.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class CommentDetailsViewController: UIViewController {

    var currentCell:Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var editCommentButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Wrong informaiton about the first section of my comments
        
        self.nameLabel.text = "Name: " + LocalDataManager.currentFood.commentNames[currentCell]
        self.dateLabel.text = "Date: " + LocalDataManager.currentFood.datesOfComments[currentCell]
        self.commentTextView.text = LocalDataManager.currentFood.comments[currentCell]
        print(LocalDataManager.currentFood.recipeKey)
        
        if(LocalDataManager.currentFood.commentNames[currentCell] == LocalDataManager.user.name){
            commentTextView.isEditable = true
            editCommentButton.isHidden = false
        }
        else{
            commentTextView.isEditable = false
            editCommentButton.isHidden = true
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func editCommentButtonTapped(_ sender: UIButton) {
       print("REC KEY", LocalDataManager.currentFood.recipeKey)
       print("Username", LocalDataManager.user.name)
       print("Comment Key", LocalDataManager.myCurrentComments[0].commentKey)
        print("RecipeName", LocalDataManager.currentFood.recipeName)
        //print(LocalDataManager.myCurrentComments[0].commentKey)
        
        let date = Date()
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        let currentDate = String(day) + "." + String(month) + "." + String(year)

        
        RequestManager.editCommentRequest(user: LocalDataManager.user.name, key: LocalDataManager.currentFood.recipeKey, comment: commentTextView.text!, currentDate: currentDate, commentName: LocalDataManager.user.name, commentKey: LocalDataManager.myCurrentComments[0].commentKey) { (sucess, statusMessage) in
            guard sucess == true && statusMessage == nil else{
                return
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

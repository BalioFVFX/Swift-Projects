//
//  AddCommentViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 26.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import SVProgressHUD

class AddCommentViewController: UIViewController {

    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addCommentButtonTapped(_ sender: UIButton) {
        
        
        LocalDataManager.allFoods[0].comments = (["User": "123", "Comment": "testComment"])
        
        //Getting the current date
        SVProgressHUD.show()
        let date = Date()
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        let currentDate = String(day) + "." + String(month) + "." + String(year)
        
        RequestManager.POSTCommentRequest(recipeKey: LocalDataManager.currentFood.recipeKey, user: LocalDataManager.user.name, comment: commentTextView.text!, date: currentDate, imageName: "user1Image.png") { (success, statusMessage) in
            guard success == true && statusMessage == nil else{
                SVProgressHUD.showError(withStatus: statusMessage)
                SVProgressHUD.dismiss(withDelay: 0.7)
                return
            }
            SVProgressHUD.showSuccess(withStatus: "Comment posted")
            SVProgressHUD.dismiss(withDelay: 0.5)
        }

        
//        RequestManager.postCommentRequest(user: LocalDataManager.currentFood.recipeUser, key: LocalDataManager.currentFood.recipeKey, comment: commentTextView.text!, currentDate: currentDate, commentName: LocalDataManager.user.name, imageName: LocalDataManager.user.myImage) { (success, statusMessage) in
//            guard success == true && statusMessage == nil else{
//                SVProgressHUD.showError(withStatus: statusMessage)
//                SVProgressHUD.dismiss(withDelay:0.7)
//                return
//            }
//        }
//        
//        SVProgressHUD.showSuccess(withStatus: "Comment posted")
//        SVProgressHUD.dismiss(withDelay:0.5)
        
    }
    
}

//
//  AddCommentViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 26.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

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
        
        //Getting the current date
        
        let date = Date()
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        let currentDate = String(day) + "." + String(month) + "." + String(year)
        
        print(currentDate)
        
        
        RequestManager.postCommentRequest(user: LocalDataManager.currentFood.recipeUser, key: LocalDataManager.currentFood.recipeKey, comment: commentTextView.text!, currentDate: currentDate, commentName: LocalDataManager.user.name)

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

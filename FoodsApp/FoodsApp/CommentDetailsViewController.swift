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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "Name: " + LocalDataManager.currentFood.commentNames[currentCell]
        self.dateLabel.text = "Date: " + LocalDataManager.currentFood.datesOfComments[currentCell]
        self.commentTextView.text = LocalDataManager.currentFood.comments[currentCell]
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

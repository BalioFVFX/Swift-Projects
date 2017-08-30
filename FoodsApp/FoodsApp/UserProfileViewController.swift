//
//  UserProfileViewController.swift
//  FoodsApp
//
//  Created by Erik Baliov on 30.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageButton: UIButton!

    var currentUserProfileImage:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentUserProfileImage = LocalDataManager.user.myImage
        self.imageButton.setImage(UIImage(named: currentUserProfileImage), for: .normal)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logoutBarButtonTapped(_ sender: UIBarButtonItem) {
                UserDefaults.standard.set(true, forKey: "hasLoggedoutBool")
                LocalDataManager.user = User()
                LocalDataManager.myFoods.removeAll()
                LocalDataManager.allFoods.removeAll()
                self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    
    @IBAction func imageButtonTapped(_ sender: UIButton){
       
        for item in LocalDataManager.myUserImages.userImages{
            if(item != currentUserProfileImage){
                imageButton.setImage(UIImage(named: item), for: .normal)
                currentUserProfileImage = item
                break
            }
        }

    }
    
    @IBAction func applyButtonTapped(_ sender: UIButton) {
        print(LocalDataManager.user.myImage)
        LocalDataManager.user.myImage = currentUserProfileImage
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

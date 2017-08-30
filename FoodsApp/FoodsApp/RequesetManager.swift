//
//  RequesetManager.swift
//  FoodsApp
//
//  Created by Erik Baliov on 22.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation

class RequestManager{
    
    
    // MARK: - CAN REGISTER CHECK
    
    class func canRegisterRequest(username:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Login User (GET https://foodsapp-4a21c.firebaseio.com/user/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/\(username)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    print(json)
                    completion(false, "This name is already registered")
                }
                    
                catch{
                    completion(true, nil)
                }
                
            }
                
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    
    
    // MARK: - REGISTER
    
    class func registerUserRequest(username:String , password:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?) -> ()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Login User (PUT https://foodsapp-4a21c.firebaseio.com/user/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/\(username)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "PUT"
        
        let bodyObject: [String : Any] = [
            "username": username.hash,
            "password": password.hash
        ]
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                completion(true, nil)
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    // MARK: - ADD RECIPE REQUEST
    
    class func addRecipeRequest(user: User, recipeName:String, recipeDetails:String, recipeTimeToCook:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?) -> ()) {
        
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (3) (POST https://foodsapp-4a21c.firebaseio.com/recipe/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipe/\(user.name)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        let bodyObject: [String : Any] = [
            "Name": user.name,
            "RecipeName": recipeName,
            "RecipeTimeToCook": recipeTimeToCook,
            "RecipeDetails": recipeDetails
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                completion(true, nil)
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    // MARK: - LOGIN
    
    class func loginUserRequest(username:String, password:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Login User (GET https://foodsapp-4a21c.firebaseio.com/user/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/\(username)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                    
                    if(json["username"] as! Int == Int(username.hash) && json["password"] as! Int == Int(password.hash)){
                        completion(true,nil)
                    }
                    else{
                        completion(false, "Wrong Name / Password")
                    }
                    
                }
                    
                catch{
                 completion(false, "Wrong details")
                }
                
                
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

    
    
    // MARK: - GET RECIPES
    
    class func getRecipesRequest(completion:@escaping (_ sucess:Bool, _ statusMessage:String?) ->() ) {
        
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (3) (GET https://foodsapp-4a21c.firebaseio.com/recipe/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipe/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                LocalDataManager.allFoods.removeAll()

                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                    
                    // Iterate through all the data by their keys
               
                
                    for item in json.allKeys{
                       
                        // Get the current data
                        if let myKey = json[item] as? NSDictionary{
                           
                            for value in myKey.allKeys{
                                
                                if let myValue = myKey[value] as? NSDictionary{
                                    //print(myValue)
                                    // Add the items
                                    LocalDataManager.addItems(name: myValue.value(forKey: "RecipeName") as! String, duration: myValue.value(forKey: "RecipeTimeToCook") as! String, recipe: myValue.value(forKey: "RecipeDetails") as! String, keyOfRecipe: value as! String, user: myValue.value(forKey: "Name") as! String)
                                    
                                }
                               
                            }
                            
                        }
                        
                    }
                    completion(true,nil)
                }
                    
                catch{
                    completion(false, "ERROR")
                }
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    class func getMyRecipesRequest(user: User, completion:@escaping (_ sucess:Bool, _ statusMessage:String?)->()) {
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (3) (GET https://foodsapp-4a21c.firebaseio.com/recipe/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipe/\(user.name)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                LocalDataManager.myFoods.removeAll()
                
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                    
                    // Iterate through all the data by their keys
                    
                 
                    
                    
                    for item in json.allKeys{

                        
                        // Get the current data
                        if let myKey = json[item] as? NSDictionary{
                            
                            LocalDataManager.addRecipesInMyFoods(name: myKey.value(forKey: "RecipeName") as! String, duration: myKey.value(forKey: "RecipeTimeToCook") as! String, recipe: myKey.value(forKey: "RecipeDetails") as! String, keyOfRecipe: item as! String, user: myKey.value(forKey: "Name") as! String)
                           
                            
                            
                        }
                        
                    }
                    
                    completion(true,nil)
                }
                    
                catch{
                    //completion(false, "ERROR")
                    //Throws error SVPRogressHUD message when recipe/user/.json is empty
                }
                
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    class func postCommentRequest(user:String, key:String, comment:String, currentDate:String, commentName:String, imageName:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Post comment (POST https://foodsapp-4a21c.firebaseio.com/recipe/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipe/\(user)/\(key)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        let bodyObject: [String : Any] = [
            "Comment": comment,
            "User": commentName,
            "Date" : currentDate,
            "Image" : imageName
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                completion(true, nil)
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

    class func GetCommentsRequest(user:String, key:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Get Comments (GET https://foodsapp-4a21c.firebaseio.com/recipe/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipe/\(user)/\(key)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                LocalDataManager.currentFood.comments.removeAll()
                LocalDataManager.currentFood.commentNames.removeAll()
                LocalDataManager.currentFood.datesOfComments.removeAll()
                LocalDataManager.myCurrentComments.removeAll()
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject

                    for item in json.allKeys{
                        
                        
                       
                        // Get the current data
                        if let myKey = json[item] as? NSDictionary{
                            LocalDataManager.currentFood.commentNames.append(myKey.value(forKey: "User") as! String)
                            LocalDataManager.currentFood.comments.append(myKey.value(forKey: "Comment") as! String)
                            LocalDataManager.currentFood.datesOfComments.append(myKey.value(forKey: "Date") as! String)
                            LocalDataManager.currentFood.commentImages.append(myKey.value(forKey: "Image") as! String)
                            if(myKey.value(forKey: "User") as! String == LocalDataManager.user.name){
                                LocalDataManager.addMyCurrentComments(comment: myKey.value(forKey: "Comment") as! String, commentName: myKey.value(forKey: "User") as! String, dateOfComment: myKey.value(forKey: "Date") as! String, commentKey: item as! String)
                            }
                        }
                        
                    }
                    
                    completion(true, nil)
                }
                 
                catch{
                    //completion(false, "ERROR")
                    //Throws error SVPRogressHUD message when recipe/user/.json is empty
                }
                
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

    class func editCommentRequest(user:String, key:String, comment:String, currentDate:String, commentName:String, commentKey:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (3) (PUT https://foodsapp-4a21c.firebaseio.com/recipe/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipe/\(user)/\(key)/\(commentKey)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "PUT"
        
        let bodyObject: [String : Any] = [
            "Comment": comment,
            "User": commentName,
            "Date" : "Edited on: " + currentDate
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                completion(true, nil)
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false, error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

}

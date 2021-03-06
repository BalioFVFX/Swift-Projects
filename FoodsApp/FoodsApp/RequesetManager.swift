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
            "password": password.hash,
            "userImage": "user1Image.png"
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
    
    
    // MARK: - GET ALL REGISTERED USERS USERNAMES
    
    class func GETUsersUsernamesRequest(completion:@escaping (_ success:Bool, _ statusMessage:String?) -> ()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         GET All registered users useranmes (GET https://foodsapp-4a21c.firebaseio.com/user/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                LocalDataManager.users.removeAll()
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                
                    
                    // Iterate through all the data by their keys
                 
                    for item in json.allKeys{
                   
                        LocalDataManager.addRegisteredUsers(username: item as! String)
                        print(item)
                        
                        
                    }
                    
                    completion(true, nil)
                }
                
                catch{
                   
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
    
    // MARK: - ADD RECIPE REQUEST
    
    // ADD RECIPE IN RECIPES
    
    class func POSTRecipeRequest(username:String, recipeName:String, recipeDetails:String, recipeDuration:String, completion:@escaping (_ success:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         POST Recipe in recipes (POST https://foodsapp-4a21c.firebaseio.com/recipes)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipes/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        let bodyObject: [String : Any] = [
            "Username": username,
            "RecipeName": recipeName,
            "RecipeDuration": recipeDuration,
            "RecipeDetails": recipeDetails
        ]
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                completion(true , nil)
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

    
    
    // ADD RECIPE IN USER/RECIPES
    
    class func POSTUserRecipeRequest(username:String, recipeName:String, recipeDetails:String, recipeDuration:String, completion:@escaping (_ success:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Post recipe (POST https://foodsapp-4a21c.firebaseio.com/users/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/\(username)/recipes/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
                let bodyObject: [String : Any] = [
                    "Username": username,
                    "RecipeName": recipeName,
                    "RecipeDuration": recipeDuration,
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

    
//    class func addRecipeRequest(user: User, recipeName:String, recipeDetails:String, recipeTimeToCook:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?) -> ()) {
//        
//        let sessionConfig = URLSessionConfiguration.default
//        
//        /* Create session, and optionally set a URLSessionDelegate. */
//        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
//        
//        /* Create the Request:
//         Request (3) (POST https://foodsapp-4a21c.firebaseio.com/recipe/.json)
//         */
//        
//        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipe/\(user.name)/.json") else {return}
//        var request = URLRequest(url: URL)
//        request.httpMethod = "POST"
//        
//        let bodyObject: [String : Any] = [
//            "Name": user.name,
//            "RecipeName": recipeName,
//            "RecipeTimeToCook": recipeTimeToCook,
//            "RecipeDetails": recipeDetails
//        ]
//        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
//        
//        /* Start a new Task */
//        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
//            if (error == nil) {
//                // Success
//                let statusCode = (response as! HTTPURLResponse).statusCode
//                print("URL Session Task Succeeded: HTTP \(statusCode)")
//                completion(true, nil)
//            }
//            else {
//                // Failure
//                print("URL Session Task Failed: %@", error!.localizedDescription);
//                completion(false, error?.localizedDescription)
//            }
//        })
//        task.resume()
//        session.finishTasksAndInvalidate()
//    }
    
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
                        LocalDataManager.user.image = json["userImage"] as! String
                        print(json["userImage"])
                        print(LocalDataManager.user.image)
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
    
    
    // GET ALL RECIPES
    
    class func GETAllRecipesRequest(completion:@escaping (_ success:Bool, _ statusMessage:String?)->()) {

        
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         GET All Recipes (GET https://foodsapp-4a21c.firebaseio.com/recipes/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipes/.json") else {return}
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
                            
                            LocalDataManager.addItems(username: myKey.value(forKey: "Username") as! String, recipeName: myKey.value(forKey: "RecipeName") as! String, recipeDuration: myKey.value(forKey: "RecipeDuration") as! String, recipeDetails: myKey.value(forKey: "RecipeDetails") as! String, recipeKey: item as! String)
                            
                            
                        }
                        
                    }
                    completion(true, nil)
                }
                    
                catch{
                    
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

    
    

    // GET MY RECIPES
    
    class func GETMyRecipesRequest(completion:@escaping (_ success:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         GET Recipe from user (GET https://foodsapp-4a21c.firebaseio.com/user/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/\(LocalDataManager.user.name)/recipes/.json") else {return}
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
                            
                            LocalDataManager.addFoodInMySection(username: myKey.value(forKey: "Username") as! String, recipeName: myKey.value(forKey: "RecipeName") as! String, recipeDuration: myKey.value(forKey: "RecipeDuration") as! String, recipeDetails: myKey.value(forKey: "RecipeDetails") as! String, recipeKey: item as! String)

                        }
                        
                    }
                    completion(true, nil)
                }
                    
                catch{
                    
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
                            
//                            LocalDataManager.addRecipesInMyFoods(name: myKey.value(forKey: "RecipeName") as! String, duration: myKey.value(forKey: "RecipeTimeToCook") as! String, recipe: myKey.value(forKey: "RecipeDetails") as! String, keyOfRecipe: item as! String, user: myKey.value(forKey: "Name") as! String)
                           
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
    
    // MARK: - COMMENTS
    
    
    // POST THE KEYS OF COMMENTS AND RECIPES IN API/USER/COMMENTS/.JSON
    
    class func POSTTheKeysOfCommentsAndRecipesInUserRequest(username:String, commentKey:String, recipeKey:String) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         POST KEYS OF RECIPES AND COMMENTS IN USER (POST https://foodsapp-4a21c.firebaseio.com/user/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/\(username)/comments/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        let bodyObject: [String : Any] = [
            "User": username,
            "CommentKey": commentKey,
            "RecipeKey" : recipeKey
        ]
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    // POST THE COMMENT IN API/RECPIES/.JSON
    
    
    
    class func PATCHSToreTheCommentKey(commentKey:String, recipeKey: String) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         PATCH STORE THE COMMENT KEY (PATCH https://foodsapp-4a21c.firebaseio.com/recipes/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipes/\(recipeKey)/comments/\(commentKey)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "PATCH"
        
        let bodyObject: [String : Any] = [
            "CommentKey": commentKey
            ]
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

    
    
    class func POSTCommentRequest(recipeKey:String, user:String, comment:String, date:String, imageName:String, completion:@escaping (_ success:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         POST Comment in all recipes (POST https://foodsapp-4a21c.firebaseio.com/recipes/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipes/\(recipeKey)/comments/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        let bodyObject: [String : Any] = [
            "RecipeKey": recipeKey,
            "User": user,
            "Comment": comment,
            "Date" : date,
            "Image" : imageName,
            
            
        ]
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                
                
                
                do{
                    
                    
                    
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    // GET THE KEY OF THE COMMENT
                    
                    for item in json.allValues{
                        
                        
                        RequestManager.POSTTheKeysOfCommentsAndRecipesInUserRequest(username: LocalDataManager.user.name, commentKey: item as! String, recipeKey: recipeKey)
                        RequestManager.PATCHSToreTheCommentKey(commentKey: item as! String, recipeKey: recipeKey)
                        break
                    }
                     completion(true, nil)
                }
                    
               

                catch{
                    
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
    
    
    // GET COMMENTS OF THE SELECTED RECIPE
    
    class func GETTheCommentsOfTheSelectedRecipeRequest(recipeKey:String, completion:@escaping (_ success:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         GET The comments of the selected recipe (GET https://foodsapp-4a21c.firebaseio.com/recipes/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipes/\(recipeKey)/comments/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                LocalDataManager.user.comments.removeAll()
                LocalDataManager.currentRecipeComments.removeAll()
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                    for item in json.allKeys{
                        
                        
                        
                        
                        // Get the current data
                        
                        // GET all the comments
                        if let myKey = json[item] as? NSDictionary{
                            LocalDataManager.addRecipeCurrentComments(user: myKey.value(forKey: "User") as! String, comment: myKey.value(forKey: "Comment") as! String, date: myKey.value(forKey: "Date") as! String, imageName: myKey.value(forKey: "Image") as! String, recipeKey: myKey.value(forKey: "RecipeKey") as! String, commentKey: myKey.value(forKey: "CommentKey") as! String)
                            
                            //GET only my comments
                            
                            if(myKey.value(forKey: "User") as! String == LocalDataManager.user.name){
                                LocalDataManager.user.comments.append(["User": myKey.value(forKey: "User") as! String, "Comment": myKey.value(forKey: "Comment") as! String, "Date": myKey.value(forKey: "Date") as! String, "Image": myKey.value(forKey: "Image") as! String, "CommentKey": myKey.value(forKey: "CommentKey") as! String, "RecipeKey": myKey.value(forKey: "RecipeKey") as! String])
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

    // EDIT THE SELECTED COMMENT
    
    class func PATCHEditCommentRequest(recipeKey:String, commentKey:String, comment:String, date:String, completion:@escaping (_ success:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         PATCH Edit comment (PATCH https://foodsapp-4a21c.firebaseio.com/recipes/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipes/\(recipeKey)/comments/\(commentKey)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "PATCH"
        
        let bodyObject: [String : Any] = [
            "Comment": comment,
            "Date" : date
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
    
    
//    class func postCommentRequest(user:String, key:String, comment:String, currentDate:String, commentName:String, imageName:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?)->()) {
//
//        let sessionConfig = URLSessionConfiguration.default
//        
//        /* Create session, and optionally set a URLSessionDelegate. */
//        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
//        
//        /* Create the Request:
//         Post comment (POST https://foodsapp-4a21c.firebaseio.com/recipe/.json)
//         */
//        
//        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipe/\(user)/\(key)/.json") else {return}
//        var request = URLRequest(url: URL)
//        request.httpMethod = "POST"
//        
//        let bodyObject: [String : Any] = [
//            "Comment": comment,
//            "User": commentName,
//            "Date" : currentDate,
//            "Image" : imageName,
//            "RecipeKey": key
//        ]
//        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
//        
//        /* Start a new Task */
//        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
//            if (error == nil) {
//                // Success
//                let statusCode = (response as! HTTPURLResponse).statusCode
//                print("URL Session Task Succeeded: HTTP \(statusCode)")
//                completion(true, nil)
//            }
//            else {
//                // Failure
//                print("URL Session Task Failed: %@", error!.localizedDescription);
//                completion(false, error?.localizedDescription)
//            }
//        })
//        task.resume()
//        session.finishTasksAndInvalidate()
//    }


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
    
    // MARK: - PROFILE IMAGES
    
    // GET COMMENTS AND RECIPES KEYS 
    
    class func GETCommentsAndRecipesKeysRequest(username:String) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         GET CommentsAndRecipeKeys (GET https://foodsapp-4a21c.firebaseio.com/user///comments.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/\(username)/comments.json") else {return}
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
                    
                    
                    // Iterate through all the data by their keys
                    
                    
                    
                    for item in json.allKeys{
                        
                        // Get the current data
                        if let myKey = json[item] as? NSDictionary{
                            
                           LocalDataManager.user.commentsAndRecipesKeys.append(["RecipeKey": myKey.value(forKey: "RecipeKey") as! String, "CommentKey": myKey.value(forKey: "CommentKey") as! String])
                            
                            
                        }
                        
                    }
                    
                }
                    
                catch{
                    
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
    
    
    // GET user image

    
    class func GETUserImageRequest(username:String, completion:@escaping (_ success:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         GET User Image (GET https://foodsapp-4a21c.firebaseio.com/user/.json)
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
                    
                    LocalDataManager.user.image = json.value(forKey: "userImage") as! String
                    completion(true,nil)
                }
                    
                catch{
            
                }

            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false,error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    // Change user image
    
    class func updateUserImage(username:String, userImage:String){
       
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         PATCH User Image (PATCH https://foodsapp-4a21c.firebaseio.com/recipes/.json)
         */
        
            guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/\(username)/.json") else {return}
            var request = URLRequest(url: URL)
            request.httpMethod = "PATCH"
            
            let bodyObject: [String : Any] = [
                "userImage": userImage
                
            ]
            request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
            
            /* Start a new Task */
            let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                if (error == nil) {
                    // Success
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                    
                }
                else {
                    // Failure
                    print("URL Session Task Failed: %@", error!.localizedDescription);
                    
                }
            })
            task.resume()
            session.finishTasksAndInvalidate()
        


    }
    
    class func PATCHUserImageRequest(userImage:String, completion:@escaping (_ success:Bool, _ statusMessage:String?)->()) {

        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         PATCH User Image (PATCH https://foodsapp-4a21c.firebaseio.com/recipes/.json)
         */
        
        RequestManager.updateUserImage(username: LocalDataManager.user.name, userImage: userImage)
        
        for comments in LocalDataManager.user.commentsAndRecipesKeys {
            
        
        guard var URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipes/\(comments["RecipeKey"]!)/comments/\(comments["CommentKey"]!)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "PATCH"
        
        let bodyObject: [String : Any] = [
            "Image": userImage
 
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                completion(true,nil)
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(false,error?.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
        }
    }
    
    
//    class func imageChangeRequest(user:String, imageName:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?)->()) {
//
//        let sessionConfig = URLSessionConfiguration.default
//        
//        /* Create session, and optionally set a URLSessionDelegate. */
//        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
//        
//        /* Create the Request:
//         Image change (PUT https://foodsapp-4a21c.firebaseio.com/recipe/.json)
//         */
//        
//        for item in LocalDataManager.myCurrentComments{
//        
//          
//        
//        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/recipe/\(user)/\(item.recipeKey)/\(item.commentKey)/.json") else {return}
//        var request = URLRequest(url: URL)
//        request.httpMethod = "PATCH"
//        
//        let bodyObject: [String : Any] = [
//            "Image": imageName
//        ]
//            
//            print("ITEM RECIPEKEY: ", item.recipeKey)
//        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
//        
//        /* Start a new Task */
//        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
//            if (error == nil) {
//                // Success
//                let statusCode = (response as! HTTPURLResponse).statusCode
//                print("URL Session Task Succeeded: HTTP \(statusCode)")
//                completion(true, nil)
//            }
//            else {
//                // Failure
//                print("URL Session Task Failed: %@", error!.localizedDescription);
//                completion(false,error?.localizedDescription)
//            }
//            
//        })
//        
//        task.resume()
//        session.finishTasksAndInvalidate()
//            
//        }
//    }


}

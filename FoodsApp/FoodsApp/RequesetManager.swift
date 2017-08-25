//
//  RequesetManager.swift
//  FoodsApp
//
//  Created by Erik Baliov on 22.08.17.
//  Copyright © 2017 None. All rights reserved.
//








import Foundation

class RequestManager{
    
    // MARK: - REGISTER
    
    class func registerUserRequest(username:String , password:String, completion:@escaping (_ sucess:Bool, _ statusMessage:String?) -> ()) {
        /* Configure session, choose between:
         * defaultSessionConfiguration
         * ephemeralSessionConfiguration
         * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Login User (PUT https://foodsapp-4a21c.firebaseio.com/user/.json)
         */
        
        guard let URL = URL(string: "https://foodsapp-4a21c.firebaseio.com/user/\(username)/.json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        let bodyObject: [String : Any] = [
            "username": username,
            "password": password
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
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                    LocalDataManager.allFoods.removeAll()
                    // Iterate through all the data by their keys
                    
                    
                    for item in json.allKeys{
                        
                        // Get the current data
                        if let myKey = json[item] as? NSDictionary{
                            
                            for value in myKey.allKeys{
                                
                                if let myValue = myKey[value] as? NSDictionary{
                                    // Add the items
                                    LocalDataManager.addItems(name: myValue.value(forKey: "RecipeName") as! String, duration: myValue.value(forKey: "RecipeTimeToCook") as! String, recipe: myValue.value(forKey: "RecipeDetails") as! String)
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
                completion(true, nil)
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                    LocalDataManager.myFoods.removeAll()
                    // Iterate through all the data by their keys
                    
                    
                    for item in json.allKeys{
                        
                        // Get the current data
                        if let myKey = json[item] as? NSDictionary{
                            
                            LocalDataManager.addRecipesInMyFoods(name: myKey.value(forKey: "RecipeName") as! String, duration: myKey.value(forKey: "RecipeTimeToCook") as! String, recipe: myKey.value(forKey: "RecipeDetails") as! String)
                            
                            
                            
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

    
}

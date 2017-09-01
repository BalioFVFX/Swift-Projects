//
//  LocalDataManager.swift
//  FoodsApp
//
//  Created by Erik Baliov on 23.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation

class LocalDataManager{
    
    static var user = User()
    static var allFoods = [Foods]()
    static var myFoods = [Foods]()
    static var currentFood = Foods()
    static var myCurrentComments = [myComments]()
    static var myUserImages = UserImages()
    static var myKeys = allKeys()
    static var users = [Users]()
    
 
    class func addRegisteredUsers(username:String){
        let user = Users()
        
        user.name = username
        
        self.users.append(user)
    }
    
    class func addMyCurrentComments(comment:String, commentName:String, dateOfComment:String, commentKey:String, recipeKey:String){
        let currentComment = myComments()
        
        currentComment.commentName = commentName
        currentComment.comment = comment
        currentComment.dateOfComment = dateOfComment
        currentComment.commentKey = commentKey
        currentComment.recipeKey = recipeKey
        
        self.myCurrentComments.append(currentComment)
    }
    
    class func addItems(username:String, recipeName:String, recipeDuration:String, recipeDetails:String){
        // Make an food object of Foods class
        let food = Foods()
        
        food.username = username
        food.recipeName = recipeName
        food.recipeDuration = recipeDuration
        food.recipeDetails = recipeDetails
        
        // Add the data to the myFoods static array of foods
        self.allFoods.append(food)
        
    }
    
//    class func addRecipesInMyFoods(name:String, duration:String, recipe:String, keyOfRecipe:String, user:String){
//        let food = Foods()
//        
//        food.recipeUser = user
//        food.recipeName = name
//        food.recipeDetails = recipe
//        food.recipeTimeToCook = duration
//        food.recipeImageName = "food.png"
//        food.comments = []
//        food.datesOfComments = []
//        food.recipeKey = keyOfRecipe
//        food.commentNames = []
//        
//        self.myFoods.append(food)
//    }
    
}

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

    static var myUserImages = UserImages()
    static var myKeys = allKeys()
    static var users = [Users]()
    static var currentRecipeComments = [RecipeComments]()
    
 
    class func addRegisteredUsers(username:String){
        let user = Users()
        
        user.name = username
        
        self.users.append(user)
    }

    class func addRecipeCurrentComments(user:String, comment:String, date:String, imageName:String, recipeKey:String, commentKey:String){
        let currentComment = RecipeComments()
        
        currentComment.user = user
        currentComment.comment = comment
        currentComment.date = date
        currentComment.imageName = imageName
        currentComment.recipeKey = recipeKey
        currentComment.commentKey = commentKey
        
        self.currentRecipeComments.append(currentComment)
    }
    
    class func addItems(username:String, recipeName:String, recipeDuration:String, recipeDetails:String, recipeKey:String){
        // Make an food object of Foods class
        let food = Foods()
        
        food.username = username
        food.recipeName = recipeName
        food.recipeDuration = recipeDuration
        food.recipeDetails = recipeDetails
        food.recipeKey = recipeKey
        
        // Add the data to the myFoods static array of foods
        self.allFoods.append(food)
        
    }
    
    class func addFoodInMySection(username:String, recipeName:String, recipeDuration:String, recipeDetails:String, recipeKey:String){
        let food = Foods()
        
        food.username = username
        food.recipeName = recipeName
        food.recipeDuration = recipeDuration
        food.recipeDetails = recipeDetails
        food.recipeKey = recipeKey
        
        self.myFoods.append(food)
        
    }
    
}

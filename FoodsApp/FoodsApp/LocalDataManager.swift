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
    
    class func addMyCurrentComments(comment:String, commentName:String, dateOfComment:String, commentKey:String){
        let currentComment = myComments()
        
        currentComment.commentName = commentName
        currentComment.comment = comment
        currentComment.dateOfComment = dateOfComment
        currentComment.commentKey = commentKey
        
        self.myCurrentComments.append(currentComment)
    }
    
    class func addItems(name:String, duration:String, recipe:String, keyOfRecipe:String, user:String){
        // Make an food object of Foods class
        let food = Foods()
        
        food.recipeUser = user
        food.recipeName = name
        food.recipeDetails = recipe
        food.recipeTimeToCook = duration
        food.recipeImageName = "food.png"
        food.comments = []
        food.datesOfComments = []
        food.recipeKey = keyOfRecipe
        food.commentNames = []
        
        // Add the data to the myFoods static array of foods
        self.allFoods.append(food)
        
    }
    
    class func addRecipesInMyFoods(name:String, duration:String, recipe:String, keyOfRecipe:String, user:String){
        let food = Foods()
        
        food.recipeUser = user
        food.recipeName = name
        food.recipeDetails = recipe
        food.recipeTimeToCook = duration
        food.recipeImageName = "food.png"
        food.comments = []
        food.datesOfComments = []
        food.recipeKey = keyOfRecipe
        food.commentNames = []
        
        self.myFoods.append(food)
    }
    
}

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
    
    class func addItems(name:String, duration:String, recipe:String){
        // Make an food object of Foods class
        let food = Foods()
        
        food.recipeName = name
        food.recipeDetails = recipe
        food.recipeTimeToCook = duration
        food.recipeImageName = "food.png"
        food.comments = []
        
        // Add the data to the myFoods static array of foods
        self.allFoods.append(food)
        
    }
    
    class func addRecipesInMyFoods(name:String, duration:String, recipe:String){
        let food = Foods()
        
        food.recipeName = name
        food.recipeDetails = recipe
        food.recipeTimeToCook = duration
        food.recipeImageName = "food.png"
        food.comments = []
        
        self.myFoods.append(food)
    }
    
}

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
    static var myFoods = [Foods]()
    
    class func addItems(name:String, duration:String, recipe:String){
        // Make an food object of Foods class
        let food = Foods()
        
        food.recipeName = name
        food.recipeDetails = recipe
        food.recipeTimeToCook = duration
        
        // Add the data to the myFoods static array of foods
        self.myFoods.append(food)
        
    }
    
}

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
        let food = Foods()
        
        food.recipeName = name
        food.recipeDetails = recipe
        food.recipeTimeToCook = duration
        self.myFoods.append(food)
  
    }
    
}

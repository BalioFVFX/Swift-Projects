//
//  DataModel.swift
//  FoodsApp
//
//  Created by Erik Baliov on 23.08.17.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation

class User{
    var name:String = ""
}

class Foods{
    var recipeUser:String = ""
    var recipeName:String = ""
    var recipeDetails:String = ""
    var recipeTimeToCook:String = ""
    var recipeImageName:String = ""
    var comments: [String] = []
    var datesOfComments: [String] = []
    var recipeKey:String = ""
}

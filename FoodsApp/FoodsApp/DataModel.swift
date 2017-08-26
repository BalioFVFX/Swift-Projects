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
    var recipeName:String = ""
    var recipeDetails:String = ""
    var recipeTimeToCook:String = ""
    var recipeImageName:String = ""
    var comments: [(comment:String, date: String)] = []
}

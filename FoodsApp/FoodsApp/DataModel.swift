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
    var image:String = ""
    var comments = [[String:String]]()
    var recipes = [[String:String]]()
}

class Users{
    var name:String = ""
    var imageName:String = ""
}

struct UserImages{
    var userImages: Set = ["user1Image.png", "user2Image.png"]
}

class Foods{
    var username:String = ""
    var recipeName:String = ""
    var recipeDuration:String = ""
    var recipeDetails:String = ""
    var recipeKey:String = ""
    var comments = [String:Any] ()
}

struct allKeys{
    var recipeKeys: [String] = []
    var commentKeys: [String] = []
}

class RecipeComments{
    var user:String = ""
    var comment:String = ""
    var date:String = ""
    var imageName:String = ""
}

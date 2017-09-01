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
    var comments: [String] = []
    var recipes = [[String:String]]()
}

class Users{
    var name:String = ""
}

struct UserImages{
    var userImages: Set = ["user1Image.png", "user2Image.png"]
}

class Foods{
    var username:String = ""
    var recipeName:String = ""
    var recipeDuration:String = ""
    var recipeDetails:String = ""
}

struct allKeys{
    var recipeKeys: [String] = []
    var commentKeys: [String] = []
}


class myComments{
    var commentName:String = ""
    var dateOfComment:String = ""
    var comment:String = ""
    var commentKey:String = ""
    var recipeKey:String = ""
}

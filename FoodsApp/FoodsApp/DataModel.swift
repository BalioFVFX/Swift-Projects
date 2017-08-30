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
    var myComments: [String] = []
    var myImage:String = ""
    var userDetails:String = ""
}

struct UserImages{
    var userImages: Set = ["user1Image.png", "user2Image.png", "user3Image.png", "user4Image.png"]
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
    var commentNames: [String] = []
}



class myComments{
    var commentName:String = ""
    var dateOfComment:String = ""
    var comment:String = ""
    var commentKey:String = ""
    //var dateOfComments:String = ""
}

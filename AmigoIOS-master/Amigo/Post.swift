//
//  Post.swift
//  Amigo
//
//  Created by אביעד on 09/03/2020.
//  Copyright © 2020 Shiran Klein. All rights reserved.
//

import Foundation
import Firebase

class Post {
    
    var title:String = ""
    var placeLocation:String = ""
    var placeImage:String = ""
    var userName:String = ""
    var recText:String = ""
    var lastUpdate: Int64?
    
    init(title:String){
        self.title = title
    }
}

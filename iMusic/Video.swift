//
//  Video.swift
//  iMusic
//
//  Created by Akiro on 28/11/2016.
//  Copyright © 2016 Esgi. All rights reserved.
//

import Foundation

class Video : NSObject{
    
    var id: String
    var title : String
    var author : String
    
    init(id : String, title : String, author : String){
        self.id = id
        self.title = title
        self.author = author
    }
    
}

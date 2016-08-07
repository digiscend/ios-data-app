//
//  Task.swift
//  App
//
//  Created by Vikas Yadav on 07/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

struct Company {
    
    let htmlid:String
    let name:String
    
    let logosrc:String
    
    let logobitmap:String
    
    
    init(name: String, htmlid: String,logosrc:String,logobitmap:String) {
        self.name = name
        self.htmlid = htmlid
        self.logobitmap=logobitmap
        self.logosrc=logosrc
    }
}
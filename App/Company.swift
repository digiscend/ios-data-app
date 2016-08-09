//
//  Task.swift
//  App
//
//  Created by Vikas Yadav on 07/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

struct Company {
    
    var htmlid:String?
    var name:String?
    
    var logosrc:String?
    
    var logobitmap:String?
    
    init()
    {
        
    }
    
    init(name: String, htmlid: String,logosrc:String,logobitmap:String) {
        self.name = name
        self.htmlid = htmlid
        self.logobitmap=logobitmap
        self.logosrc=logosrc
    }
    
    static func parseJsonObject(jcompany:NSDictionary) -> Company
    {
        var obj:Company = Company()
        if let name = jcompany["name"] as? String {
            obj.name = name
        }
        
        return obj
        
    }
}
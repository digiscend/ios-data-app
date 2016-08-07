//
//  Task.swift
//  App
//
//  Created by Vikas Yadav on 07/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

struct Project {
    
    let htmlid:String
    let name:String
    
    let country:String
    let company:Company?
    let intro:String
    let year:String
    
    let milestoneProjects: [Project] = []
    
    var majorProjects: [Project] = []
    
    var attrvalues: [AttrValue] = []
    
    init(name: String, htmlid: String,country:String,intro:String,year:String,company:Company) {
        self.name = name
        self.htmlid = htmlid
        self.intro=intro
        self.year=year
        self.country=country
        self.company=nil;
    }
}
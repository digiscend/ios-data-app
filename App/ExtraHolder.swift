//
//  ExtraHolder.swift
//  App
//
//  Created by Vikas Yadav on 10/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

class ExtraHolder: NSObject {
    
    enum baseView
    {
        case COUNTRY
        case STAGE
        case MINERAL
        case PROJECTS
        case PROJECT
    };
   
    var filterInfoStrings:[String] = [];
    var filterCacheId:[String] = [];
    
    var baseType:baseView? = nil
    
    var mineral_name:String  = "";
    var mineral_filter:String = "";
    
    var stage_name:String = "";
    var stage_filter:String = "";
    
    var country_name:String = "";
    var country_filter:String  = "";
    
    var search_name:String  = "";
    var search_filter:String = "";
    
    override init()
    {
    
            
    }
    
}

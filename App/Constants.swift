//
//  Constants.swift
//  App
//
//  Created by Vikas Yadav on 07/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

struct Constants {
    static let APISERVER:String = "http://new.digiscend.com" //"http://10.0.0.10" //"http://192.168.5.2"
    static let API_PROJECTLIST:String = "/api/projectlist"
    static let API_STAGELIST:String = "/api/stages"
    static let API_MINERALLIST:String = "/api/minerals"
    static let API_COUNTRYLIST:String = "/api/countries"
    static let API_PROJECT:String = "/api/project";
    
    static let ID_BUTTON_COUNTRIES = "BrowseCountries"
    static let ID_BUTTON_MINERALS = "BrowseMinerals"
    static let ID_BUTTON_STAGES = "BrowseStages"
    static let ID_BUTTON_PROJECTS = "BrowseProjects"
    
    static let baseView_COUNTRY = 1;
    static let baseView_STAGE = 2;
    static let baseView_MINERAL = 3;
    static let baseView_PROJECTS = 4;
    static let baseView_PROJECT = 5;
    
}

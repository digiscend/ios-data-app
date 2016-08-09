//
//  Task.swift
//  App
//
//  Created by Vikas Yadav on 07/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

struct Project {
    
    var htmlid:String
    var name:String
    
    var country:String
    var company:Company

    var intro:String?
    var year:String?
    var fees:String?
    var statusslug:String?
    
    var milestoneProjects: [Project] = []
    
    var majorProjects: [Project] = []
    
    var attrvalues: [AttrValue] = []
    
    init()
    {
        self.country = "";
        self.name = "";
        self.htmlid = "";
        self.company = Company()
    }
    
    init(name: String, htmlid: String,country:String,intro:String,year:String,company:Company)
    {
        self.name = name
        self.htmlid = htmlid
        self.intro=intro
        self.year=year
        self.country=country
        self.company=company;
    }
    
    static func loadlistByFilters(filters:String, filters2:String, versionCode:Int) -> [Project]
    {
        var url:String = Constants.APISERVER
            + Constants.API_PROJECTLIST
            + filters + "?lang="
            + NSLocalizedString("api_q_lang", comment: "")
        
        url += "&v=\(versionCode)"
        //Log.v (Constants.LOG_PLURL, url);
        let jsonData:NSDictionary = Reader.execute ([url]);
        let projects:[Project] = parseJson (jsonData)
        return projects
    }
    
    /**
    * @see http://www.codeproject.com/Articles/267023/Send-and-receive-json-between-android-and-php
    * @param json
    * @see http://roadfiresoftware.com/2015/10/how-to-parse-json-with-swift-2/
    * @return
    */
    static func parseJson(obj:NSDictionary) -> [Project]
    {
        var projects:[Project] = []
        
        
        if let jprojects = obj["projects"] as? [[String: AnyObject]] {
            for jproject in jprojects {
                projects.append(parseJsonObject(jproject))
            }
        }
        
        return projects
    }
    
    static func parseJsonObject(jproject:NSDictionary) -> Project
    {
        var obj:Project = Project()
        if let name = jproject["name"] as? String {
            obj.name = name
        }
        if let intro = jproject["intro"] as? String {
            obj.intro = intro
        }
        if let countryName = jproject["countryName"] as? String {
            obj.country = countryName
        }
        
        if let statusslug = jproject["statusslug"] as? String {
            obj.statusslug = statusslug
        }

        //let logo:String = projecti.objectForKey("logo") as NSString

        if let htmlid = jproject["htmlid"] as? String {
            obj.htmlid = htmlid
        }

        
        if let fees = jproject["fees"] as? String {
            obj.fees = fees
        }

        if let year = jproject["year"] as? String {
            obj.year = year
        }

        //let gallery:String = projecti.objectForKey("statusslug") as NSString
        //let minerals:String = projecti.objectForKey("statusslug") as NSString
        //let selectedCompany:String = projecti.objectForKey("statusslug") as NSString
        if let jcompany = jproject["selectedCompany"] as? NSDictionary {
            obj.company = Company.parseJsonObject(jcompany)
        }
        
        //let statusname:String = projecti.objectForKey("statusname") as NSString

        return obj

    }
        
}
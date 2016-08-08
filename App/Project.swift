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
    
    init(name: String, htmlid: String,country:String,intro:String,year:String,company:Company?)
    {
        self.name = name
        self.htmlid = htmlid
        self.intro=intro
        self.year=year
        self.country=country
        self.company=nil;
    }
    
    static func loadlistByFilters(filters:String, filters2:String, versionCode:Int) -> [Project]
    {
        //let p = Project(name: "project1",htmlid: "html",country: "India",intro: "intro",year: "2010",company: Company(name: "comp1",htmlid: "html2",logosrc: "",logobitmap: ""))
        
        var url:String = Constants.APISERVER
            + Constants.API_PROJECTLIST
            + filters + "?lang="
            + NSLocalizedString("api_q_lang", comment: "")
        
        url += "&v=\(versionCode)"
        //Log.v (Constants.LOG_PLURL, url);
        let jsonData:NSDictionary = Reader.execute ([url]);
        let projects:[Project] = parseJson (jsonData)
        return []
    }
    
    /**
    * @see http://www.codeproject.com/Articles/267023/Send-and-receive-json-between-android-and-php
    * @param json
    * @return
    */
    static func parseJson(obj:NSDictionary) -> [Project]
    {
        var projects:[Project] = []
        var projects0:NSArray?
        
        let enumerator = obj.keyEnumerator()
        while let key3: NSString = enumerator.nextObject() as NSString? {
            //key3 is projects
            if key3 == "projects"
            {
                projects0 = obj.objectForKey(key3) as? NSArray
                var s:Int? = projects0?.count
                for index in 0...s!-1
                {
                    var projecti:NSDictionary = projects0?.objectAtIndex(0) as NSDictionary
                    let name:String = projecti.objectForKey("name") as NSString
                    let intro:String = projecti.objectForKey("intro") as NSString
                    let countryName:String = projecti.objectForKey("countryName") as NSString
                    let statusslug:String = projecti.objectForKey("statusslug") as NSString
                    let logo:String = projecti.objectForKey("logo") as NSString
                    let htmlid:String = projecti.objectForKey("htmlid") as NSString
                    var fees:String?;
                    //if projecti.objectForKey("fees").isKindOfClass(NSString)
                    //{
                        fees = projecti.objectForKey("fees") as NSString
                    //}
                    let year:String = projecti.objectForKey("year") as NSString
                    //let gallery:String = projecti.objectForKey("statusslug") as NSString
                    //let minerals:String = projecti.objectForKey("statusslug") as NSString
                    //let selectedCompany:String = projecti.objectForKey("statusslug") as NSString
                    //let sector:String = projecti.objectForKey("statusslug") as NSString
                    let statusname:String = projecti.objectForKey("statusname") as NSString
                    projects.append(Project(name:name, htmlid: htmlid, country: countryName, intro: intro, year: year, company: nil))
                    return []
                }
                return [];
                //projects0 = obj[key3] as? NSDictionary;
            }
            print(key3)
        }
        
        
        for val1 in obj[0] as NSArray
        {
                for val2 in val1 as NSArray
                {
                    return [];
                }
        }
        
        
        
        for (key1,val1) in obj
        {
            if key1 as NSString == "projects"
            {
                for val2 in val1 as NSArray
                {
                    return [];
                }
            }
            else
            {
                return []
            }
        }
        return []
        /*
        
    if(!obj.has ("projects"))
    return null;
    
    JSONArray jProjects = obj.getJSONArray ("projects");
    
    for (int i = 0; i < jProjects.length (); i++)
    {
    HashMap<String, String> map = new HashMap<String, String> ();
    JSONObject jsonProject = jProjects.getJSONObject (i);
    
    Project p = parseJsonObject (jsonProject);
    projects.add (p);
    }
    }
    catch(Exception e)
    {
    return null;
    }
    return projects;
    
    }
    
    /**
    * Parses single object data from json object
    * @see http://www.codeproject.com/Articles/267023/Send-and-receive-json-between-android-and-php
    * @param json
    * @return
    */
    public static Project parseJsonObject(JSONObject jProject)
    {
    Project obj = new Project ();
    try
    {
    if(!jProject.has ("name") ||
    !jProject.has ("htmlid") ||
    !jProject.has ("intro") ||
    !jProject.has ("countryName"))
    return null;
    
    obj.name = jProject.getString ("name");
    obj.htmlid = jProject.getString ("htmlid");
    obj.country = jProject.getString ("countryName");
    obj.intro = jProject.getString ("intro");
    
    if(jProject.has("year"))
    obj.year = jProject.getString ("year");
    
    if(jProject.has ("selectedCompany"))
    {
    Company c = null;
    obj.company = c.parseJsonObject(jProject.getJSONObject ("selectedCompany"));
    }
    
    AttrValue av = null;
    if(jProject.has("attributevalues"))
    {
    try
    {
    JSONObject avs = jProject.getJSONObject ("attributevalues");
    obj.attrvalues = av.parseJsonObject (avs);
    }
    catch (Exception e)
    {
    //any error
    }
    }
    
    processProjects("milestoneProjects",obj.milestoneProjects,jProject);
    processProjects("majorProjects", obj.majorProjects,jProject);
    
    }
    catch(Exception e)
    {
    return null;
    }
    return obj;*/
    
    }
}
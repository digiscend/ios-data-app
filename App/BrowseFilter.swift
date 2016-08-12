//
//  BrowseFilter.swift
//  App
//
//  Created by Vikas Yadav on 11/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

class BrowseFilter: NSObject {
    
    var name:String = "";
    var htmlid:String = "";
    var lastbrowsetype:ExtraHolder? = nil;
    
    static func parseJson(obj:NSDictionary,browsetype:ExtraHolder) -> [BrowseFilter]
    {
        let key:String;
        switch(browsetype.baseType)
        {
        case Constants.baseView_COUNTRY:
            key = "countries";
        case Constants.baseView_STAGE:
            key = "status";
        case Constants.baseView_MINERAL:
            key = "minerals";
        default:
            key = "minerals";
        }
        
        var filtervals:[BrowseFilter] = []
        
        if let jfilters = obj[key] as? [[String: AnyObject]] {
            for jfilter in jfilters {
                filtervals.append(parseJsonObject(jfilter))
            }
        }
        return filtervals
    }    
    
    static func parseJsonObject(jfilter:NSDictionary) -> BrowseFilter
    {
        let obj:BrowseFilter = BrowseFilter.init()
        if let name = jfilter["name"] as? String {
            obj.name = name
        }
        
        if let htmlid = jfilter["htmlid"] as? String {
            obj.htmlid = htmlid
        }
        
        return obj
        
    }
    
    static func loadlistByFilters(browsetype:ExtraHolder) -> [BrowseFilter]
    {
        let filters:String = browsetype.getFilters ();
        //Log.v(Constants.LOG_BWFILTER,filters);
        //let String:filterCacheId  = browsetype.getFilterCacheId ();
        
        //var filtervals:[BrowseFilter]  = [];
        
        let api_browselisttype:String = browsetype.getBaseAPI ();
        //TODO:String CACHEFILENAME = "filters." + versionCode + "." + filterCacheId;

        
        //NSLocalizedString("api_q_lang", comment: "")
        let url:String = Constants.APISERVER
            + api_browselisttype
            + filters
            + "?lang=" + NSLocalizedString("api_q_lang", comment: "")
            //TODO:+ "&v=" + versionCode;
        //Log.v (Constants.LOG_BWURL, url);
        if let jsonData:NSDictionary = Reader.execute ([url])
        {
            let filtervals:[BrowseFilter] = BrowseFilter.parseJson (jsonData,browsetype: browsetype)
            return filtervals
        }
        return []
    }
}

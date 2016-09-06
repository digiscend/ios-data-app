//
//  ExtraHolder.swift
//  App
//
//  Created by Vikas Yadav on 10/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

class ExtraHolder: NSObject,NSCopying {
   
    var filterInfoStrings:[String]? = [];
    var filterCacheId:String = "";
    
    var baseType:Int = 0
    
    var mineral_name:String  = "";
    var mineral_filter:String = "";
    
    var stage_name:String = "";
    var stage_filter:String = "";
    
    var country_name:String = "";
    var country_filter:String  = "";
    
    var search_name:String  = "";
    var search_filter:String = "";
    
    init(baseTypeP:Int)
    {
        filterCacheId = "";
        self.baseType = baseTypeP
    }
    
    func getBaseAPI() -> String
    {
        var api_browselisttype:String = "";
    
        switch(self.baseType)
        {
        case Constants.baseView_STAGE:
                api_browselisttype = Constants.API_STAGELIST;
                //TODO:activity.setTitle (activity.getResources().getString(R.string.title_browse_stage));
                break;
        case Constants.baseView_COUNTRY:
                api_browselisttype = Constants.API_COUNTRYLIST;
                //TODO:activity.setTitle (activity.getResources().getString(R.string.title_browse_country));
                break;
        case Constants.baseView_MINERAL:
                api_browselisttype = Constants.API_MINERALLIST;
                //TODO:activity.setTitle (activity.getResources().getString(R.string.title_browse_mineral));
        default:
                api_browselisttype = Constants.API_MINERALLIST;
        }
        return api_browselisttype;
    }
    
    func getFilterInfoStrings() -> [String]?
    {
        if let fis:[String] = self.filterInfoStrings
        {
            return fis
        }
        else
        {
            return [];
        }
    }
    
    func addFilter(val:BrowseFilter)
    {
        //what type of list view was called?
        switch(val.lastbrowsetype!.baseType)
        {
        case Constants.baseView_COUNTRY:
            self.country_filter = val.htmlid;
            self.country_name = val.name;
            break;
        case Constants.baseView_STAGE:
            self.stage_filter = val.htmlid;
            self.stage_name = val.name;
            break;
        case Constants.baseView_MINERAL:
            self.mineral_filter = val.htmlid;
            self.mineral_name = val.name;
            break;
        default: break
        }
        self.baseType = Constants.baseView_PROJECTS
    }
    
    /// Creates API call paths based on the filters in use.
    /// Output can use multiple type of filters together
    /// Generated path is ready to use for HTTP[S] callw
    func getFilters() -> String
    {
        var filters:String = "";
        self.filterInfoStrings?.removeAll()
        
        if(self.country_filter != "")
        {
            filters += "/country/" + self.country_filter;
            filterCacheId += "-country-" + self.country_filter;
            //TODO:filterInfoStrings.add ( NSLocalizedString("filterinfo_by_country", comment: "") + ": " + self.country_name);
        }
        
        if(self.stage_filter != "")
        {
            filters += "/stage/" + self.stage_filter;
            filterCacheId += "-stage-" + self.stage_filter;
            //TODO:this.filterInfoStrings.add ( context.getResources().getString(R.string.filterinfo_by_stages) + ": " + this.stage_name);
        }
        
        if(self.mineral_filter != "" )
        {
            filters += "/mineral/" + self.mineral_filter;
            filterCacheId += "-mineral-" + self.mineral_filter;
            //TODO:this.filterInfoStrings.add ( context.getResources().getString(R.string.filterinfo_by_mineral) + ": " + this.mineral_name);
        }
        
        if(self.search_filter != "")
        {
            filters += "/q/" + self.search_filter;
            filterCacheId += "-search-" + self.search_filter;
            //TODO:this.filterInfoStrings.add ( context.getResources().getString(R.string.filterinfo_by_search) + ": " + this.search_filter);
        }
        
        return filters;
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let o2:ExtraHolder = ExtraHolder(baseTypeP: self.baseType)
        
        o2.filterCacheId = self.filterCacheId
        o2.filterInfoStrings = self.filterInfoStrings

        o2.mineral_filter = self.mineral_filter
        o2.mineral_name = self.mineral_name
        
        o2.stage_filter = self.stage_filter
        o2.stage_name = self.stage_name
        
        o2.country_filter = self.country_filter
        o2.country_name = self.country_name
        
        o2.search_filter = self.search_filter
        o2.search_name = self.search_name
        
        return o2
    }

    
}

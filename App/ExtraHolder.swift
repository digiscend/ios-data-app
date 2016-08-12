//
//  ExtraHolder.swift
//  App
//
//  Created by Vikas Yadav on 10/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//

import UIKit

class ExtraHolder: NSObject {
   
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
        
    }
    
    func getFilters() -> String
    {
        var filterCacheId:String = "";
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
            //TODO:filterCacheId += "-stage-" + self.stage_filter;
            //TODO:this.filterInfoStrings.add ( context.getResources().getString(R.string.filterinfo_by_stages) + ": " + this.stage_name);
        }
        
        if(self.mineral_filter != "" )
        {
            filters += "/mineral/" + self.mineral_filter;
            //TODO:filterCacheId += "-mineral-" + this.mineral_filter;
            //TODO:this.filterInfoStrings.add ( context.getResources().getString(R.string.filterinfo_by_mineral) + ": " + this.mineral_name);
        }
        
        if(self.search_filter != "")
        {
            filters += "/q/" + self.search_filter;
            //TODO:filterCacheId += "-search-" + this.search_filter;
            //TODO:this.filterInfoStrings.add ( context.getResources().getString(R.string.filterinfo_by_search) + ": " + this.search_filter);
        }
        
        return filters;
    }
    
}

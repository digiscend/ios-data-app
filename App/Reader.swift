//
//  Reader.swift
//  App
//
//  Created by Vikas Yadav on 07/08/16.
//  Copyright (c) 2016 Digiscend. All rights reserved.
//
import UIKit

struct Reader
{
    static func execute(url1:[String]) -> NSDictionary
    {
        var jsonResult: NSDictionary!
        
        for index in 0...url1.count-1
        {
            let urlPath: String = url1[index]
            
            var url: NSURL = NSURL(string: urlPath)!
            var request1: NSMutableURLRequest = NSMutableURLRequest(URL: url)
            
            request1.HTTPMethod = "GET"
            request1.timeoutInterval = 60
            let queue:NSOperationQueue = NSOperationQueue()
            var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
            var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
            var err: NSError?
            println(response)
            jsonResult = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary
            println("Synchronous\(jsonResult)")
        }
        return jsonResult
    }
}

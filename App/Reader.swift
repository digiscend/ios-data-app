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
    
    static func execute(url1:[String]) -> NSData?
    {
        var dataVal: NSData!
        
        for index in 0...url1.count-1
        {
            let urlPath: String = url1[index]
            
            let url: NSURL = NSURL(string: urlPath)!
            let request1: NSMutableURLRequest = NSMutableURLRequest(URL: url)
            
            request1.HTTPMethod = "GET"
            request1.timeoutInterval = 60
            let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
            dataVal =  try! NSURLConnection.sendSynchronousRequest(request1, returningResponse: response)
        }
        return dataVal
    }
}

//
//  NetworkController.swift
//  Stackoverflow
//
//  Created by Kirby Shabaga on 7/29/14.
//  Copyright (c) 2014 Worxly. All rights reserved.
//

import Foundation
import UIKit

class NetworkController : NSObject, NSURLSessionDataDelegate {
    
    var prefix = "https://api.stackexchange.com"
    // restrict page size to 1 for now
    var pagesieze = 5
    var suffix = "/2.2/search?order=desc&sort=activity&site=stackoverflow&pagesize="  // 1&intitle="
    
    // /2.2/search?order=desc&sort=activity&intitle=Swift&site=stackoverflow
    
    func searchInTitle(str : String, view : UITextView) {
        
        println("NetworkController.searchInTitle(str : \(str))")
        
        let url = NSURL(string: "\(prefix)\(suffix)\(pagesieze)&intitle=\(str)")
        println("url = \(url)")
        //TODO: bounds checking
        
        let request = NSURLRequest(URL: url)

        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        var task = session.dataTaskWithRequest(request, completionHandler:
            {(data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
                if error {
                    println("We received an error, let's stop now")
                    return
                }
                if !self.goodHTTPStatus(response) {
                    println("We received a bad response, let's stop now")
                    return
                }
                
                var searches = Search.parseFromNSData(data)
                
                for search in searches {
                    println("search = \(search.title)")
                    NSOperationQueue.mainQueue().addOperationWithBlock({
                        view.text = view.text + "\n\(search.title)"
                    })
                }
                
            })
        
        task.resume()
        
    }
    
    func goodHTTPStatus(response : NSURLResponse) -> Bool {
        
        var rc = false
        
        var code = response as? NSHTTPURLResponse
        var httpStatus = code!.statusCode
        
        println("httpStatus = \(httpStatus)")
        
        switch httpStatus {
        case 200:
            rc = true
        default:
            println("Unexpected HTTP Status code returned.\n\(code)")
        }
        
        return rc
    }
    
}
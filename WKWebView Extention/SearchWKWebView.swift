//
//  SearchWKWebView.swift
//  SearchWKWebView
//
//  Created by Scott Stahurski on 1/9/19.
//  Copyright © 2019 allscripts. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView {

    func highlightAllOccurencesOfString(string:String)  {
        
        if let path = Bundle.main.url(forResource: "SearchWebView", withExtension: "js") {
            do{
                let data:Data = try Data(contentsOf: path)
                let jsCode:String = String(decoding: data, as: UTF8.self)
                
                //print( jsCode)
                
                //inject the search code
                self.evaluateJavaScript(jsCode, completionHandler: nil)
                //search function
                let searchString = "WKWebView_HighlightAllOccurencesOfString('\(string)')"
                //perform search
                self.evaluateJavaScript(searchString, completionHandler: nil)

                
            } catch {
                print("could not load javascript:\(error)")

            }
        
            
        }
    }
    
    func handleSearchResultCount( completionHandler: @escaping (_ count:Int) -> Void ) {
        //count function
        let countString  = "WKWebView_SearchResultCount"
        
        //get count
        self.evaluateJavaScript(countString) { (result, error) in
            if error == nil {
                if result != nil {
                        let count = result as! Int
                        completionHandler(count)
                }
            }
        }
    }
    
    
    func removeAllHighlights(){
        self.evaluateJavaScript("WKWebView_RemoveAllHighlights()", completionHandler: nil)
    }
    
    func searchNext(){
        self.evaluateJavaScript("WKWebView_SearchNext()", completionHandler: nil)
    }
    
    func searchPrevious(){
        self.evaluateJavaScript("WKWebView_SearchPrev()", completionHandler: nil)
    }
}

//
//  ViewController.swift
//  SearchWKWebView
//
//  Created by Scott Stahurski on 1/9/19.
//  Copyright © 2019 allscripts. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var occurancesLabel: UILabel!
    
    
    var totalItemsfound:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url:URL = URL(string:"https://www.slashdot.org")!
        let urlRequest:URLRequest = URLRequest(url:url)
        
        webView.load(urlRequest)
        
        occurancesLabel.text = ""
        
    }
    
    
    //SEARCH
    /////////////////////////////////////////////////////////
    
    func searchForText(){
        
        self.webView.removeAllHighlights()
        
        let searchText:String = searchTextField.text ?? ""
        
        if searchText.count > 0{
            //hilight all occurances
            webView.highlightAllOccurencesOfString(string: searchText)
            
            //get the count
            //define completion handler closure for the count
            let countCompletionHandler: (Int) -> Void = {
                self.occurancesLabel.text = "\($0)"
                print("count found : \($0)")
            }
            //get the count
            webView.handleSearchResultCount( completionHandler: countCompletionHandler )
        }
        
    }
    
    //UITextFiledDelegate
    ///////////////////////////////////////////////
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //do a search
        self.searchForText()
        //remove keyboard
        self.searchTextField.resignFirstResponder()
        
        return true
    }
    

    //SELECTORS
    ////////////////////////////////////////////////
    
    @IBAction func searchWebViewSelector(_ sender: Any) {
        
        self.searchForText()
        self.searchTextField.resignFirstResponder()
        
    }
    
    
    @IBAction func searchNextSelector(_ sender: Any) {
        webView.searchNext()
    }
    
    @IBAction func searchPreviousSelector(_ sender: Any) {
        webView.searchPrevious()
    }
    
}


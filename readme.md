SearchWKWebView
========
Swift / iOS.   This is an extention of the WKWebView that will allow the searching of a web page for a specific string.

Features
========
It will hilight in yellow ( but you can change that in the JS code) all occurances of a search string in a UIWebView.
Next, if you are using the previous/next features it will scroll to the next/previous occurance and hilight it in green ( again, you can change that color as well in the JS)


What you need if you want to put it in your project
---
SearchWebView.js
SearchWKWebView.swift


How to use it
--- 
The WKWebView extention methods are pretty self explanitory

```swift
func highlightAllOccurencesOfString(string:String)  

func handleSearchResultCount( completionHandler: @escaping (_ count:Int) -> Void ) 

func removeAllHighlights()

func searchNext()

func searchPrevious()

```
Pretty straight forward except the handleSearchResultCount is a bit tricky.
Because in Swift, when calling javascript in code it is done on a seperate thread, you will have to create a completion handler closure to get notified on when this call is completed...

The code here has a great example of how to do this in the view controller.


```swift
//get the count
//define completion handler closure for the count
    let countCompletionHandler: (Int) -> Void = {
        self.occurancesLabel.text = "\($0)"
        print("count found : \($0)")
    }
    
    //get the count
    webView.handleSearchResultCount( completionHandler: countCompletionHandler )

```
Thats it!!!
Pretty straight forward mothods to extend and use on WKWebView

Possible Extentions
--- 
Setting the hilight colors......


License
--- 
[MIT](http://choosealicense.com/licenses/mit/) open source... 

Donate
--- 
If you found it useful and it saved you time and effort, please donate...  Thank you!
[![](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.me/SStahurski)

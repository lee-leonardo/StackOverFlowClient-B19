//
//  WebViewController.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 8/2/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

	@IBOutlet weak var webView: UIWebView!
	var questionContent : Question?
	var tagContent : TempTag?

	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		if questionContent? {
			var urlString = questionContent?.link
			var url = NSURL(string: urlString)
			var request = NSURLRequest(URL: url)
			webView.loadRequest(request)
		} else if tagContent? {
			var tagName = tagContent!.name
			var url = NSURL(string: "http://www.stackoverflow.com/tags/" + tagName! )
			var request = NSURLRequest(URL: url)
			webView.loadRequest(request)
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

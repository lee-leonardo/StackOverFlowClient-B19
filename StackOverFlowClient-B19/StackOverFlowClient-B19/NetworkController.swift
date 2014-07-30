//
//  NetworkController.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/29/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkControllerDelegate {

}

class NetworkController: NSObject, NSURLSessionTaskDelegate {
//	NSURLSessionDownloadDelegate
	var delegate : NetworkControllerDelegate?
	
//	This project is going to focus on building a data task and also the download task.
//	Normally you choose between a data task and a upload task for an action, but since we are not uploading, we are going to focus on the data task.
	
	let apiDomain = ""
	let searchEndpoint = ""
	func fetchQuestionsForSearchTerm(searchTerm: String, callback: (questions : [Question]?, errorDescription : String) -> Void) {
		
//		var url = NSURL(string: apiDomain + searchEndpoint + "&tagged=\(searchTerm)")
		var url = NSURL(string: SearchQuery().prepareURL())
		//var url = NSURL(string: "http://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=swift&site=stackoverflow")
		
		let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
		
		let task = session.dataTaskWithURL(url, completionHandler: {
			(data: NSData!, reponse: NSURLResponse!, error: NSError!) -> Void in
				if error {
				//Check errors
				//General callback, passing error description and no errors.
					println(error)
					callback(questions: nil, errorDescription: "Unfortunately this didn't work...")
				} else {
					//1. Downcast the NSURLResponse to get httpResponse
					if let httpResponse = reponse as? NSHTTPURLResponse {
						switch httpResponse.statusCode {
						case 200:
							println("Great")
							//callback with question object
							
							var jsonData : NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
							println("JSON Serialized Data:\n\(jsonData)")
							
						case 400:
							println("Bad parameters")
							callback(questions: nil, errorDescription: "Bad parameters")
						case 401:
							println("Access token required")
						case 404:
							println("Not found")
						case 500:
							println("")
							callback(questions: nil, errorDescription: "Try again later")
						default:
							println("")
							callback(questions: nil, errorDescription: "Sorry try again next time!")
						}
					}
				}
			})
		task.resume()
	}
	
//MARK: NSURLSessionTaskDelegate
//MARK: NSURLSessionDownloadDelegate
}

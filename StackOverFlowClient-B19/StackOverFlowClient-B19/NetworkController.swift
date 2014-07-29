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

//MARK: NetworkController Methods
	func prepareSessionDataTask() {
//		var baseSearchString = "http://api.stackexchange.com/docs/2.2/search?"
//		var addSearchParam = "order=desc&sort=activity&tagged=Swift&site=stackoverflow"
//		baseSearchString += addSearchParam
		
//		var url = NSURL(string: baseSearchString)
		var url = NSURL(string: "http://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=swift&site=stackoverflow")
		
		var request = NSMutableURLRequest(URL: url)
		request.HTTPMethod = "GET"
		
		let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
		
		let repoDataTask = session.dataTaskWithRequest(request, completionHandler: {
			(data, reponse, error) in
			if error {
				//General error
				println(error)
			} else {
				if let httpResponse = reponse as? NSHTTPURLResponse {
					switch httpResponse.statusCode {
					case 200:
						println("Good to go!")
//						println("Response:\n\(reponse)")
//						println("Data:\n\(data)")
						var jsonData : NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
						println("JSON Serialized Data:\n\(jsonData)")
						
					case 400:
						println("Bad Parameter")
					case 401:
						println("Access Token Required")
					case 404:
						println("No method!")
					case 500:
						println("Internal error")
					default:
						println("Response code!")
					}
				}
			}
		})
		repoDataTask.resume()
	}
	
//MARK: NSURLSessionTaskDelegate
//MARK: NSURLSessionDownloadDelegate
}

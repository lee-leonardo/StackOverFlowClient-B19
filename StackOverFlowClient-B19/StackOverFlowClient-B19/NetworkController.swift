//
//  NetworkController.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/29/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

protocol NetworkControllerDelegate {}

class NetworkController: NSObject, NSURLSessionTaskDelegate {
//	NSURLSessionDownloadDelegate
	var delegate : NetworkControllerDelegate?
	
//
	
	
//	This project is going to focus on building a data task and also the download task.
//	Normally you choose between a data task and a upload task for an action, but since we are not uploading, we are going to focus on the data task.
	
//MARK: SampleData method
	func fetchQuestionsFromSampleData(callback:(questions: [Question]?, errorDescription: String?) -> Void) {
		
		let sampleData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("TestJSON", ofType: "json"))
		var questions = Question.parseJSONData(sampleData)
		callback(questions: questions, errorDescription: nil)
		
	}
	
//MARK: FetchQuestion method
	func fetchQuestionsForSearchTerm(searchTerm: String, callback: (questions : [Question]?, errorDescription : String?) -> Void) {
		
//		var url = NSURL(string: apiDomain + searchEndpoint + "&tagged=\(searchTerm)")
		var url = NSURL(string: self.prepareURL())
		//var url = NSURL(string: "http://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=swift&site=stackoverflow")
		
//		if searchTerm {}
		
		let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
		
		let task = session.dataTaskWithURL(url, completionHandler: {
			(data: NSData!, reponse: NSURLResponse!, error: NSError!) -> Void in
			
				if error {
				//Check errors
				//General callback, passing error description and no errors.
					//println(error)
					callback(questions: nil, errorDescription: "Unfortunately this didn't work...")
					//Prevents the task.resume() from firing.
					return
					
				} else {
					//println(reponse)
					if let httpResponse = reponse as? NSHTTPURLResponse { //1. Downcast the NSURLResponse to get httpResponse
						switch httpResponse.statusCode {
						case 200:
							println("Successfully received data. Send to parser.")
//							println(data)
							var questions = Question.parseJSONData(data)
							callback(questions: questions, errorDescription: nil)
							
						case 400:
							println("400 Bad parameters")
							callback(questions: nil, errorDescription: "400: Bad parameters")
						case 401:
							println("401")
							callback(questions: nil, errorDescription: "You need to be signed in to use this feature")
						case 404:
							println("404")
						case 500:
							println("500")
							callback(questions: nil, errorDescription: "Try again later")
						default:
							println("? (Defaulted)")
							callback(questions: nil, errorDescription: "Sorry try again next time!")
						}
					}
				}
			})
		task.resume()
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//This would be an extra challenge.... do not focus on right now!
//MARK: SearchStringGenerator method
	struct api {
		let domain = "http://api.stackexchange.com/"
		let version = "2.2/"
		
		struct methods {
			let search = "search?"
			let answer = "answer?"
			let tags = "tags?"
		}
//		var currentSearch = api.domain + api.version + api.methods.search
	}
	
	let apiDomain = "http://api.stackexchange.com/"
	let version = "2.2/"
	let search = "search?"
	
	var order = "order=" //Good for an enum
	var sort = "&sort=" //Good for an enum
	var tagged = "&tagged="
	var notTagged = "&nottagged="
	var intitle = "&intitle="
	let site = "&site=stackoverflow"
	
	enum orderValue {
		case desc, asc
	}
	
	enum sortValue {
		case activity, votes, creation, relevance
	}
	
	func prepareURL()-> String {
		var returnString = apiDomain + version + search
		
		//Make this a nested function (which checks which parts of the parameters) that takes the parameters and generates a search!
		
		//Test
		//if  {} else {}
		/*
		//Each one should be in an if statement
		let orderKey = orderValue.desc //Have this connected to an IBOutlet?
		switch orderKey {
		case .desc:
		order += "desc"
		case .asc:
		order += "asc"
		default:
		println()
		}
		returnString += order
		
		//Each should be in an if
		let sortKey = sortValue.activity //Connect to an IBOutlet?
		switch sortKey {
		case .activity:
		sort += "activity"
		case .votes:
		sort += "votes"
		case .creation:
		sort += "creation"
		case .relevance:
		sort += "relevance"
		default:
		println()
		}
		returnString += sort
		*/
		
		order += "asc"
		returnString += order
		
		sort += "activity"
		returnString += sort
		
		tagged += "Swift"
		returnString += tagged
		
		//		intitle += "How"
		//		returnString += intitle
		
		
		//		for segment in urlSegments {
		//			println("\(segment)")
		//		}
		
		//		for var index = 0; index < urlSegments.count; index++ {
		//			var segment = ""
		//			if index != 0 {
		//				segment += urlSegments.removeAtIndex(0)
		//			} else {
		//				segment += "&"
		//				segment += urlSegments.removeAtIndex(0)
		//			}
		//			returnString += segment
		//		}
		
		returnString += site
		
		
		println("Within Search Query: \(returnString)")
		return returnString
	}
}

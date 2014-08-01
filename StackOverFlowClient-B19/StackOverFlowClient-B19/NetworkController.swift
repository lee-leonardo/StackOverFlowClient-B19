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
	let TempTags = "tags?"
	
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
	
//	This project is going to focus on building a data task and also the download task.
//	Normally you choose between a data task and a upload task for an action, but since we are not uploading, we are going to focus on the data task.
	
//MARK: SampleData method
	func fetchQuestionsFromSampleData(callback:(questions: [Question]?, errorDescription: String?) -> Void) {
		
		let sampleData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("TestJSON", ofType: "json"))
		var questions = Question.parseJSONData(inputJSON: sampleData)
		callback(questions: questions, errorDescription: nil)
		
	}
	
//MARK: FetchQuestion method
	func fetchQuestionsForSearchTerm(searchTerm: String, callback: (questions : [Question]?, errorDescription : String?) -> Void) {
		var url = NSURL(string: prepareQuestionURL(searchBar: searchTerm))
		//var url = NSURL(string: "http://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=swift&site=stackoverflow")
		
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
							//println("Successfully received data. Send to parser.")
							//println(data)
							//if searchScope == "" {} if searchScope == "" {}
							var questions = Question.parseJSONData(inputJSON: data)
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
	func fetchTagsForSearchTag(searchTag: String, callback: (tag : [TempTag]?, errorDescription : String?) -> Void) {
		
		var url = NSURL(string: prepareTagURL(searchTag: searchTag))
		//var url = NSURL(string: "http://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=swift&site=stackoverflow")
		
		let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
		
		let task = session.dataTaskWithURL(url, completionHandler: {
			(data: NSData!, reponse: NSURLResponse!, error: NSError!) -> Void in
			
			if error {
				//Check errors
				//General callback, passing error description and no errors.
				//println(error)
				callback(tag: nil, errorDescription: "Unfortunately this didn't work...")
				//Prevents the task.resume() from firing.
				return
				
			} else {
				//println(reponse)
				if let httpResponse = reponse as? NSHTTPURLResponse { //1. Downcast the NSURLResponse to get httpResponse
					switch httpResponse.statusCode {
					case 200:
						//println("Successfully received data. Send to parser.")
						//println(data)
						//if searchScope == "" {} if searchScope == "" {}
						var tags = TempTag.parseJSONData(inputJSON: data)
						callback(tag: tags, errorDescription: nil)
						
					case 400:
						println("400 Bad parameters")
						callback(tag: nil, errorDescription: "400: Bad parameters")
					case 401:
						println("401")
						callback(tag: nil, errorDescription: "You need to be signed in to use this feature")
					case 404:
						println("404")
					case 500:
						println("500")
						callback(tag: nil, errorDescription: "Try again later")
					default:
						println("? (Defaulted)")
						callback(tag: nil, errorDescription: "Sorry try again next time!")
					}
				}
			}
			})
		task.resume()
	}
	
//MARK: TagStringGenerator method
	func prepareQuestionURL(searchBar intitle: String)-> String {
		var returnString = apiDomain + version + TempTags
		var urlSegments = [String]()
		
		//urlSegments.append(apiDomain)
		//urlSegments.append(version)
		//urlSegments.append(search)
		urlSegments.append( "intitle=" + intitle )
		//println(intitle)
		
		var firstTime = true
		for segment in urlSegments {
			if firstTime {
				returnString += segment
				firstTime = false
			} else {
				returnString += "&" + segment
			}
		}
		returnString += site
		//println("Within Search Query: \(returnString)")
		return returnString
	}
	
	func prepareTagURL(searchTag inname: String)-> String {
		var returnString = apiDomain + version + search
		var urlSegments = [String]()
		
		//urlSegments.append(apiDomain)
		//urlSegments.append(version)
		//urlSegments.append(search)
		urlSegments.append( "inname=" + inname )
		//println(intitle)
		
		
		
		var firstTime = true
		for segment in urlSegments {
			if firstTime {
				returnString += segment
				firstTime = false
			} else {
				returnString += "&" + segment
			}
		}
		returnString += site
		//println("Within Search Query: \(returnString)")
		return returnString
	}
	
}

	
	
	


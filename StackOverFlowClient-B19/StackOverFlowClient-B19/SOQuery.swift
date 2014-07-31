//
//  URLQuery.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/31/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation

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

class SOQuery {


	
	//This would be an extra challenge.... do not focus on right now!
	//MARK: SearchStringGenerator method
	class func prepareURL(searchBar intitle: String )-> String {
		var returnString = apiDomain + version + search
		
		
		var urlSegments = [String]()
		
//		urlSegments.append(apiDomain)
//		urlSegments.append(version)
//		urlSegments.append(search)
		urlSegments.append( "intitle=" + intitle )
//		println(intitle)
		
		
		
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
		
//		order += "asc"
//		returnString += order
//		sort += "activity"
//		returnString += sort
//		tagged += "Swift"
//		returnString += tagged
		
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
//		println("Within Search Query: \(returnString)")
		return returnString
	}

	
}

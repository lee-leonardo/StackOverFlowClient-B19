//
//  SearchQuery.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/29/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation

//This is going to be an extension of the Controller that will call the search strings.
class SearchQuery {
	let base = "http://api.stackexchange.com/2.2/search?"
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
		var finishedString = base
		
		//Make this a nested function that takes the parameters and generates a search!
		
		//Test
		//if  {} else {}
		
		order += "desc"
		finishedString += order

		
		sort += "activity"
		finishedString += sort
		
		
		tagged += "Swift"
		finishedString += tagged
		
//		intitle += "How"
//		finishedString += intitle
		
		finishedString += site
		
		println("Within Search Query: \(finishedString)")
		return finishedString
	}
}
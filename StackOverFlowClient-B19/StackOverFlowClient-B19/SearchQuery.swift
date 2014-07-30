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
		finishedString += order
		
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
		finishedString += sort
		*/
		
		
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
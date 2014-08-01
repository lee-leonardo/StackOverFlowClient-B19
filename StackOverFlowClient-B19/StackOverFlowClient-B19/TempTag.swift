//
//  TempTag.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 8/1/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation

class TempTag {
	
	//	Refactor this out of this file and put it into another one.
	//http://api.stackexchange.com/2.2/tags?order=desc&sort=popular&inname=swift&site=stackoverflow
	
	var name: String?
	var synonyms: Bool?
	var count: Int?
	var required: Bool?
	var moderatorOnly: Bool?
	
	init() {}
	
	//TODO: Parse method
	//Attributed to Collin Atherton (his idea of putting the parser in the data obj)
	class func parseJSONData(inputJSON data: NSData) -> [TempTag] {
		var tags = [TempTag]()
		
		if let dataDict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary {
			//This is where I'll draw data from the item dictionary and apply then use a tag initializer to build them up from the dictionary built here.
			//println(dataDict) //This is the whole dictionary
			if let items = dataDict["items"] as? NSArray {
				//println(items) //This is the whole list of tag
				for item in items {
					//println(item) //This is an individual tag
					if let itemEntry = item as? NSDictionary {
						//println("Individual Item Entry: \(itemEntry)")
						
						if itemEntry["is_moderator_only"] as? Bool == false {
							let tag = TempTag()
							tag.name = itemEntry["name"] as? String
							tag.synonyms = itemEntry["has_synonyms"] as? Bool
							tag.count = itemEntry["count"] as? Int
							tag.required = itemEntry["is_required"] as? Bool
							tag.moderatorOnly = itemEntry["is_moderator_only"] as? Bool
							tags.append(tag)
						}
					}
				}
			}
		}
		
		//println(tags)
		return tags
	}
	
}
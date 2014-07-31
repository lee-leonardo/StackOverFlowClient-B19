//
//  Question.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation

class Question {
//	title, questionID, tags, answer_count, display_name, userID
	
	var title: String?
	var questionID: Int?
	var answerCount : Int?
	var displayName : String?
	var userID: Int?
	var tags : [String]?
	
//	var answered : Bool?
//	var createDate : Int?
//	var lastActivity : Int?
//	var viewCount : Int?
//	var votes : Int?
	
//MARK: Initializers
	init () {}
	
	convenience init(questionID: Int, title: String, viewCount: Int, score: Int, answered: Bool?, withTags: [String] ) {
		self.init()
		self.questionID = questionID
		self.title = title
//		self.viewCount = viewCount
//		self.votes = score
//		self.answered = answered
		self.tags = withTags
	}

//MARK: Parse method
	//Attributed to Collin Atherton (his idea of putting the parser in the data obj)
	class func parseJSONData(inputJSON data: NSData) -> [Question] {
		var questions = [Question]()
		
		if let dataDict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary {
			//This is where I'll draw data from the item dictionary and apply then use a question initializer to build them up from the dictionary built here.
			//println(dataDict) //This is the whole dictionary
			if let items = dataDict["items"] as? NSArray {
				//println(item) //This is the whole list of question
				for item in items {
					//println(item) //This is an individual question
					if let itemEntry = item as? NSDictionary {
						//println("Individual Item Entry: \(itemEntry)")
						
						let question = Question()
						question.title = itemEntry["title"] as? String
						question.questionID = itemEntry["user_id"] as? Int
						question.answerCount = itemEntry["answer_count"] as? Int
						question.tags = itemEntry["tags"] as? Array
						
						if let itemOwner = itemEntry["owner"] as? NSDictionary {
							question.displayName = itemOwner["display_name"] as? String
							question.userID = itemOwner["user_id"] as? Int
						}
						
						//println("\(question.displayName): \(question.title)")
						questions.append(question)
					}
				}
			}
		}
		
		//println(questions)
		return questions
	}
}
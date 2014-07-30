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
	
	
	var tags : [String]?
	var owner = Dictionary<String, String>()
	var answered : Bool?
	var answerCount : Int?
	var createDate : Int?
	var lastActivity : Int?
	var viewCount : Int?
	var votes : Int?
	
	var questionID: Int?
	var title: String?
	
	init(questionID: Int, title: String, viewCount: Int, score: Int, answered: Bool?, withTags: [String] ) {
		self.questionID = questionID
		self.title = title
		self.viewCount = viewCount
		self.votes = score
		self.answered = answered
		self.tags = withTags
	}
	
//	convenience init( created: Int, lastSeen: Int) {
//		self.init()
//		self.createDate = created
//		self.lastActivity = lastSeen
//	}
	
	
}
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
}
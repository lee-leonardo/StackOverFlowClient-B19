//
//  Question.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation

class Question {
	var tags = [String]()
	var owner = Dictionary<String, String>()
	var answered : Bool?
	var answerCount : Int?
	var createDate : Int
	var lastActivity : Int
	var viewCount : Int
	var votes : Int
	
	
	var questionID: Int
	var title: String
	var link: String
	
	init(questionID: Int, title: String, link: String, created: Int, lastSeen: Int, viewCount: Int, score: Int, answered: Bool?) {
		self.questionID = questionID
		self.title = title
		self.link = link
		self.createDate = created
		self.lastActivity = lastSeen
		self.viewCount = viewCount
		self.votes = score
		self.answered = answered
	}
	
	
}
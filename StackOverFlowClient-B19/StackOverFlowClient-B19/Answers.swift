//
//  Answers.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation

class Answers {
//	var owner : Dictionary<String, String>
	var accepted : Bool?
	var answerID : Int?
	var questionID : Int?
	var rating : Int?
	
	init() {}
	
	convenience init(forQuestion: Int, theAnswer: Int, score: Int) {
		self.init()
//		answerer: Dictionary<String, String>,
//		self.owner = answerer
		self.questionID = forQuestion
		self.answerID = theAnswer
		self.rating = score
	}
}
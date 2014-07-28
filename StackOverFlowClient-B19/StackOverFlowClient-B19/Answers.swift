//
//  Answers.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation

class Answers {
	var owner = Dictionary<String, String>()
	var accepted : Bool?
	var answerID : Int
	var questionID : Int
	
	init(question: Int, answer: Int) {
		self.questionID = question
		self.answerID = answer
	}
}
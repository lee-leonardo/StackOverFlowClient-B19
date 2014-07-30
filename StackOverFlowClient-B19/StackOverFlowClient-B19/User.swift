//
//  User.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation

class User {
	var displayName: String?
	var reputation: Int?
	var accountID : Int?
	var userID : Int?
	var rating: Int?
	
	var SOEmployee : Bool?
	
	init() {}
	
	convenience init(display_Name: String, reputation: Int, accountID: Int, userID: Int, score: Int) {
		self.init()
		self.displayName = display_Name
		self.reputation = reputation
		self.accountID = accountID
		self.userID = userID
		self.rating = score

	}
	
	convenience init(isEmployee: Bool, display_Name: String, reputation: Int, accountID: Int, userID: Int, score: Int) {
		self.init(display_Name: display_Name, reputation: reputation, accountID: accountID, userID: userID, score: score)
		self.SOEmployee = isEmployee
	}
	
}
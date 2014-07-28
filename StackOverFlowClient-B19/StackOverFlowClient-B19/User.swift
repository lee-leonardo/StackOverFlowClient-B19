//
//  User.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import Foundation

class User {
	var displayName: String
	var reputation: Int
	var accountID : Int
	var userID : Int
	
	var SOEmployee : Bool?
	var userType : String
	
	init(display_Name: String, reputation: Int, accountID: Int, userID: Int, userType: String, employee: Bool?) {
		self.displayName = display_Name
		self.reputation = reputation
		self.accountID = accountID
		self.userID = userID
		self.userType = userType
		if let ofSO = employee {
			self.SOEmployee = ofSO
		}
	}
	
}
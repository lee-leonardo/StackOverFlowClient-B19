//
//  ViewController.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NetworkControllerDelegate {
	
	let networkController = NetworkController()
	var questions: [Question]?
                            
	override func viewDidLoad() {
		super.viewDidLoad()
		self.networkController.delegate = self
		
		getJSON(fromSample: true)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
//MARK: View Controller methods
//TODO: getJSON
	func getJSON(fromSample: Bool? = false) {
		if fromSample {
			self.networkController.fetchQuestionsFromSampleData({
				(questions: [Question]?, errorDescription: String?) -> Void in
				if errorDescription {
					//Error handling.
				} else {
					NSOperationQueue.mainQueue().addOperationWithBlock({
						() -> Void in
						//					self.questions = questions
						//					self.tableView.reloadData()
						})
					
					//				println(questions)
				}
				})
		}
		self.networkController.fetchQuestionsForSearchTerm("", callback: {
			(questions: [Question]?, errorDescription: String?) -> Void in
			if errorDescription {
				//Error handling.
			} else {
				NSOperationQueue.mainQueue().addOperationWithBlock({
					() -> Void in
//					self.questions = questions
//					self.tableView.reloadData()
					})
				
//				println(questions)
			}
			})
	}
	
	


}


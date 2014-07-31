//
//  ViewController.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NetworkControllerDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	let networkController = NetworkController()
	var questions: [Question]?
                            
	override func viewDidLoad() {
		super.viewDidLoad()
		getJSON(fromSample: true)

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	override func viewWillAppear(animated: Bool) {
		self.networkController.delegate = self

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
						self.questions = questions
						self.tableView.reloadData()

						})
					//println(questions)
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
					self.questions = questions
					self.tableView.reloadData()

					})
				
//				println(questions)
			}
			})
	}
	
//MARK: UITableViewDataSource
	func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		var cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as UITableViewCell
		
		if questions {
			var questionDetail = questions![indexPath.row]
			cell.textLabel.text = questionDetail.title

		}
		
		
		return cell
	}
	func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		if questions {
			return questions!.count
		} else {
			return 10
		}
	}

	
	


}


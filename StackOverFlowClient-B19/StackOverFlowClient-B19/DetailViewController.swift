//
//  DetailViewController.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, NetworkControllerDelegate, UITableViewDataSource, UISearchBarDelegate {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var detailSearch: UISearchBar!
	
	let networkController = NetworkController()
	var questions: [Question]?
                            
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 35
		self.networkController.delegate = self
		self.detailSearch.delegate = self
		
		
//		self.detailSearch
		
		getJSONFromSample()
//		getJSONFrom("Tag")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	override func viewWillAppear(animated: Bool) {

	}
	
//MARK: View Controller methods
	func getJSONFrom(searchEntry: String) {
		self.networkController.fetchQuestionsForSearchTerm(searchEntry, callback: {
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
	func getJSONFromSample() {
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
	
//MARK: UITableViewDataSource
	func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		var cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as QuestionCell
		
		if questions {
			var questionDetail = questions![indexPath.row]
			cell.textView.scrollEnabled = false
			cell.textView.text = questionDetail.title
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
	
//MARK: UISearchBarDelegate
	func searchBarSearchButtonClicked(searchBar: UISearchBar!)  {
		getJSONFrom(searchBar.text)
		searchBar.resignFirstResponder()
	}
}









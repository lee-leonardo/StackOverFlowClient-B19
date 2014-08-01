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
	var searchQuestion = true
	var errorCode: String?
	var questions: [Question]?
	var tags: [TempTag]?
                            
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 35
		self.networkController.delegate = self
		self.detailSearch.delegate = self
		
		//Testing Code
		getJSONFromSample()
		//getJSONFrom("Tag")
	}
	
//MARK: View Controller methods
	func getJSONFromQuestion(searchEntry title: String) {
		self.networkController.fetchQuestionsForSearchTerm(title, callback: {
			(questions: [Question]?, errorDescription: String?) -> Void in
			if errorDescription {
//				self.errorCode = errorDescription
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
	func getJSONFromTag(searchTag tag: String) {
		self.networkController.fetchTagsForSearchTag(tag, callback: {
			(tags: [TempTag]?, errorDescription: String?) -> Void in
			if errorDescription {
//				self.errorCode = errorDescription
			} else {
				NSOperationQueue.mainQueue().addOperationWithBlock({
					() -> Void in
					self.tags = tags
					self.tableView.reloadData()
					
					})
				
				//println(tags)
			}
			})
	}
	func getJSONFromSample() {
			self.networkController.fetchQuestionsFromSampleData({
				(questions: [Question]?, errorDescription: String?) -> Void in
				if errorDescription {
					//Can't really produce an error.
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
		var cell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath) as SearchCell
		cell.textView.scrollEnabled = false
		
		if errorCode {
			cell.errorDescription = errorCode
		} else if let question = questions?[indexPath.row] {
			cell.cellQuestion = question
		} else if let tag = tags?[indexPath.row] {
			cell.cellTag = tag
		}
		
		return cell
	}
	func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		
		if questions?.count > 0 && searchQuestion {
			return questions!.count
		} else if tags?.count > 0 {
			return tags!.count
		}
		return 1
	}
	
//MARK: UISearchBarDelegate
	func searchBarSearchButtonClicked(searchBar: UISearchBar!)  {
		//self.errorCode = nil
		//self.questions = nil
		//self.tags = nil
		
		switch searchBar.selectedScopeButtonIndex {
		case 0:
			getJSONFromQuestion(searchEntry: searchBar.text)
		case 1:
			getJSONFromTag(searchTag: searchBar.text)
		default:
			println("This will never fire...\nError in searchBarSearchButtonClicked method.")
		}
		
		searchBar.resignFirstResponder()
	}
	func searchBar(searchBar: UISearchBar!, selectedScopeButtonIndexDidChange selectedScope: Int) {
		//println("\(searchBar.scopeButtonTitles[selectedScope])")
		searchQuestion = !searchQuestion
		//println(searchQuestion)
		
	}

}









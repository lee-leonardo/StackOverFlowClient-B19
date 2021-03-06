//
//  DetailViewController.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/28/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, NetworkControllerDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var detailSearch: UISearchBar!
	
	let networkController = NetworkController()
	var searchQuestion = true
	var questions: [Question]?
	var tags: [TempTag]?
                            
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
	func getJSONFromQuestion(searchEntry title: String) {
		self.networkController.fetchQuestionsForSearchTerm(title, callback: {
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
	func getJSONFromTag(searchTag tag: String) {
		self.networkController.fetchTagsForSearchTag(tag, callback: {
			(tags: [TempTag]?, errorDescription: String?) -> Void in
			if errorDescription {
				//Error handling.
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
//MARK: UITableViewDelegate
	func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
		let webView = self.storyboard.instantiateViewControllerWithIdentifier("WebView") as WebViewController
		
		switch detailSearch.selectedScopeButtonIndex {
		case 0:
			//println("Case 1")
			webView.questionContent = self.questions?[indexPath.row]
			
		case 1:
			//println("Case 2")
			webView.tagContent = self.tags?[indexPath.row]
			
		default:
			println("This will never fire...")
		}
		
		if self.navigationController {
			self.navigationController.pushViewController(webView, animated: true)
		}
		
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
	
//MARK: UITableViewDataSource
	func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		var cell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath) as SearchCell
		cell.textView.scrollEnabled = false
		
		if searchQuestion && questions?.count > 0 {
			var questionDetail = questions![indexPath.row]
			cell.textView.text = questionDetail.title
		}
		if searchQuestion == false && tags?.count > 0 {
			var tagDetail = tags![indexPath.row]
			cell.textView.text = tagDetail.name
		}
		
//		//println(detailSearch.selectedScopeButtonIndex)
//			if questions?.count > 0 && detailSearch.selectedScopeButtonIndex == 0 {
//				var questionDetail = questions![indexPath.row]
//				cell.textView.text = questionDetail.title
//			} else if tags?.count > 0 && detailSearch.selectedScopeButtonIndex == 1 {
//				var tagDetail = tags![indexPath.row]
//				cell.textView.text = tagDetail.name
//			}

		return cell
	}
	func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		
//		if questions?.count > 0 && searchQuestion {
//			return questions!.count
//		} else if tags?.count > 0 {
//			return tags!.count
//		}
		
		switch detailSearch.selectedScopeButtonIndex {
		case 0:
			if questions?.count > 0 {
				return questions!.count
			}
		case 1:
			return tags!.count
		default:
			println("This should never fire!")
			return 1
		}
		return 1
	}
	
	
//MARK: UISearchBarDelegate
	func searchBarSearchButtonClicked(searchBar: UISearchBar!)  {
		
		switch searchBar.selectedScopeButtonIndex {
		case 0:
			//tags = nil //?
			getJSONFromQuestion(searchEntry: searchBar.text)
		case 1:
			//questions = nil //?
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









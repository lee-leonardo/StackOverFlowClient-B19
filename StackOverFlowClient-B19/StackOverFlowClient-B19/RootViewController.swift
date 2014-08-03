//
//  RootViewController.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/30/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//	This is not working nor do I have the time and patience to make it work at this moment.
	
	let listOfViewControllers = ["Detail", "Tutorial"]

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
//MARK: UITableViewDataSource
	func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		var cell = tableView.dequeueReusableCellWithIdentifier("RootCell") as UITableViewCell
		cell.textLabel.text = listOfViewControllers[indexPath.row]
		
		return cell
		
	}
	func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return listOfViewControllers.count
	}
	
//MARK: UITableViewDelegate
	
	
}

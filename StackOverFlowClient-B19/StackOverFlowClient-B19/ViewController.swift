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
                            
	override func viewDidLoad() {
		super.viewDidLoad()
		self.networkController.delegate = self
		
		getJSON()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
//MARK: View Controller methods
//TODO: getJSON
	func getJSON() {		
		self.networkController.prepareSessionDataTask()

	}
	
	


}


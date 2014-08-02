//
//  TutorialViewController.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 8/1/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
	@IBOutlet weak var tutorialText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
		tutorialText.text = "Thank you for using this StackOverFlowClient. This client features the ability to search for Questions and Tags.\nQuestions will not search if left blank. However this is not the case for tags, which will grab a list of the most popular. Clicking on a cell utilizes the link to either pull up the question or pull up questions related to the tag."

    }
	@IBAction func closeTutorial(sender: AnyObject) {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
}

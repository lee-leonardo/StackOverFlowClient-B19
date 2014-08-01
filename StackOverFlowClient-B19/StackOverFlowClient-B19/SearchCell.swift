//
//  SearchCell.swift
//  StackOverFlowClient-B19
//
//  Created by Leonardo Lee on 7/30/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

	@IBOutlet weak var textView: UITextView!
	var errorDescription: String?
	var cellQuestion: Question?
	var cellTag: TempTag?
	
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    override func awakeFromNib() {
        super.awakeFromNib()
		
//		if errorDescription {
//			textView.text = errorDescription!
//		} else
			if let question = cellQuestion?.title {
			textView.text = question
		} else if cellTag?.name {
			textView.text = cellTag!.name
		} else if NSUserDefaults.standardUserDefaults().boolForKey("firstTime") {
			textView.text = "ATTENTION:\n1. By default the search searches Stack Overflow for questions related to your query.\n2. Switching to the tags searches for similar tags.\n3. Clicking on these cells (after a query) will "
		}
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

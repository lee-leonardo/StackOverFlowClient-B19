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
	
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

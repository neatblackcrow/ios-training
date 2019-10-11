//
//  ContentTableViewCell.swift
//  TableViewExample
//
//  Created by GLO_macbookpro on 8/10/2562 BE.
//  Copyright © 2562 GLO_macbookpro. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

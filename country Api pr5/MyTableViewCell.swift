//
//  MyTableViewCell.swift
//  country Api pr5
//
//  Created by Jenish Navadiya on 24/03/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

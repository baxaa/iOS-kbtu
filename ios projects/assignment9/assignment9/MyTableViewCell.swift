//
//  MyTableViewCell.swift
//  assignment9
//
//  Created by Baqbergen Onalbekov on 17.11.2024.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myTitle: UILabel!
    static let identifier = "MyTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
//        myImage.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

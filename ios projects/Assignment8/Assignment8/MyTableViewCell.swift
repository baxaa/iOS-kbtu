//
//  MyTableViewCell.swift
//  Assignment8
//
//  Created by Baqbergen Onalbekov on 16.11.2024.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myYear: UILabel!
    static let identifier = "MyTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

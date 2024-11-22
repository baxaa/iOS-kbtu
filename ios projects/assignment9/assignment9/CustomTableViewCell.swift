//
//  CustomTableViewCell.swift
//  assignment9
//
//  Created by Baqbergen Onalbekov on 21.11.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

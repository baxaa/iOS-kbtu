//
//  DetailViewController.swift
//  assignment9
//
//  Created by Baqbergen Onalbekov on 17.11.2024.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var CustomImage: UIImageView!
    @IBOutlet weak var TitleLbl: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    var titleTxt = ""
    var imgTxt = ""
    var descri = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CustomImage.image = UIImage(named: imgTxt)
        self.TitleLbl.text = titleTxt
        self.desc.text = descri
        // Do any additional setup after loading the view.
    }


}

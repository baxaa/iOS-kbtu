//
//  SecondViewController.swift
//  Assignment8
//
//  Created by Baqbergen Onalbekov on 17.11.2024.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieTxt: UILabel!
    var posterTxt = ""
    var titleTxt = ""
    var yearTxt = ""
    var genreTxt = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.poster.image = UIImage(named: posterTxt)
        self.movieYear.text = yearTxt
        self.movieTitle.text = titleTxt
        self.movieTxt.text = genreTxt
    }
    

}

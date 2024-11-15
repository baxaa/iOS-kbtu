//
//  ViewController.swift
//  Dieceee
//
//  Created by Baqbergen Onalbekov on 13.10.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let randomIndex1 = Int.random(in: 0...5)
        let randomIndex2 = Int.random(in: 0...5)
        
        dice1.image = UIImage(named: diceImages[randomIndex1])
        dice2.image = UIImage(named: diceImages[randomIndex2])
    }
}


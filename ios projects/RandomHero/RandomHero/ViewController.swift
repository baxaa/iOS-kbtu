//
//  ViewController.swift
//  RandomHero
//
//  Created by Baqbergen Onalbekov on 06.12.2024.
//

import UIKit
import Alamofire
import Kingfisher

struct Hero: Decodable{
    let name: String
    let powerstats: PowerStats
    let appearance: Appearance
    let biography: Biography
    let images: HeroImage
    
    struct PowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let power: Int
        let speed: Int
        let combat: Int
        let durability: Int
    }
    
    struct Appearance: Decodable {
        let gender: String
        let race: String
    }
    
    struct Biography: Decodable {
        let fullName: String
        let alterEgos: String
        let placeOfBirth: String
    }

    struct HeroImage: Decodable {
        let sm: String
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var intelligence: UILabel!
    @IBOutlet weak var strength: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var combat: UILabel!
    @IBOutlet weak var durability: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var alterEgos: UILabel!
    @IBOutlet weak var placeOfBirth: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var race: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButton(_ sender: Any) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }
    private func fetchHero(by id: Int) {
        
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        
        AF.request(urlString).responseDecodable(of: Hero.self) { response in
            switch response.result {
            case .success(let hero):
                self.dataHandler(with: hero)
            case .failure(let error):
                self.errrorHandler(error: error)
            }
        }
    }
    
    private func dataHandler(with hero: Hero) {
        print("hero: ")
        DispatchQueue.main.async {
            self.name.text = hero.name
            self.intelligence.text = "Intelligence: \(hero.powerstats.intelligence)"
            self.strength.text = "Strength:\(hero.powerstats.strength)"
            self.power.text = "Power: \(hero.powerstats.power)"
            self.speed.text = "Speed: \(hero.powerstats.speed)"
            self.combat.text = "Combat: \(hero.powerstats.combat)"
            self.durability.text = "Durability: \(hero.powerstats.durability)"
            self.gender.text = "Gender: \(hero.appearance.gender)"
            self.race.text = "Race: \(hero.appearance.race)"
            self.fullName.text = hero.biography.fullName
            self.alterEgos.text = "Ego: \(hero.biography.alterEgos)"
            self.placeOfBirth.text = "Home: \(hero.biography.placeOfBirth)"
        }
        
        if let imageUrl = URL(string: hero.images.sm) {
            self.image.kf.setImage(with: imageUrl)
        } else {
            self.image.image = nil
        }
    }

    private func errrorHandler(error: AFError) {
        DispatchQueue.main.async {
            self.name.text = error.localizedDescription + "\nReroll again"
            self.image.image = nil
            self.intelligence.text = "No data"
            self.strength.text = "No data"
            self.power.text = "No data"
            self.speed.text = "No data"
            self.combat.text = "No data"
            self.durability.text = "No data"
            self.gender.text = "No data"
            self.race.text = "No data"
            self.fullName.text = "No data"
            self.alterEgos.text = "No data"
            self.placeOfBirth.text = "No data"
        }

    }
    
}


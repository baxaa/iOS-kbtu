//
//  ViewController.swift
//  Assignment10
//
//  Created by Baqbergen Onalbekov on 05.12.2024.
//

import UIKit

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
        let race: String?
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

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var intelligence: UILabel!
    @IBOutlet weak var strength: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var combat: UILabel!
    @IBOutlet weak var durability: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var race: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var alterEgos: UILabel!
    @IBOutlet weak var placeOfBirth: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollerButton(_ sender: Any) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }
    
    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        print("here: ", url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard self.errrorHandler(error: error) == false else {
                return
            }

            guard let data else { return }
            self.dataHandler(data: data)
        }.resume()
    }
    
    private func dataHandler(data: Data) {
        do {
            print("hero: ")
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            let heroImage = self.getImageFromURL(string: hero.images.sm)
            
            DispatchQueue.main.async {
                self.name.text = hero.name
                self.image.image = heroImage
                self.intelligence.text = "Intelligence: \(hero.powerstats.intelligence)"
                self.strength.text = "Strength:\(hero.powerstats.strength)"
                self.power.text = "Power: \(hero.powerstats.power)"
                self.speed.text = "Speed: \(hero.powerstats.speed)"
                self.combat.text = "Combat: \(hero.powerstats.combat)"
                self.durability.text = "Durability: \(hero.powerstats.durability)"
                self.gender.text = hero.appearance.gender
                self.race.text = hero.appearance.race
                self.fullName.text = hero.biography.fullName
                self.alterEgos.text = hero.biography.alterEgos
                self.placeOfBirth.text = hero.biography.placeOfBirth
            }
            
        } catch {
            print("here 108:", error.localizedDescription)
            DispatchQueue.main.async {
                self.name.text = error.localizedDescription + "\nReroll again"
                self.image.image = nil
                self.intelligence.text = ""
                self.strength.text = ""
                self.power.text = ""
                self.speed.text = ""
                self.combat.text = ""
                self.durability.text = ""
                self.gender.text = ""
                self.race.text = ""
                self.fullName.text = ""
                self.alterEgos.text = ""
                self.placeOfBirth.text = ""
            }
        }
    }
    
    private func getImageFromURL(string: String) -> UIImage? {
        guard
            let url = URL(string: string),
            let imageData = try? Data(contentsOf: url)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }
    
    private func errrorHandler(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print(error.localizedDescription)
        return true
    }
}


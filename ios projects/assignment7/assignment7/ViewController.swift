//
//  ViewController.swift
//  assignment7
//
//  Created by Baqbergen Onalbekov on 14.11.2024.
//

import UIKit

struct Movie {
    let title: String
    let year: String
    let genre: String
    let poster: String
}


class ViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    
    let movies: [Movie] = [
        Movie(title: "Avengers", year: "2012", genre: "Action", poster: "avengers.jpg"),
        Movie(title: "Pirates of the Caribbean", year: "2007", genre: "Fantasy", poster: "pirates.jpg"),
        Movie(title: "Inception", year: "2010", genre: "Sci-Fi", poster: "inception.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        TableView.dataSource = self
        TableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(movies[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as?         MovieCellTableViewCell else {
                return UITableViewCell()
        }
        let movie = movies[indexPath.row]
        print("Configuring cell for movie:", movie)
        cell.titleLabel.text = movie.title
        cell.yearLabel.text = movie.year
        cell.genreLabel.text = movie.genre
        cell.posterImageView.image = UIImage(named: movie.poster)
        if cell.posterImageView.image == nil {
                    print("Image not found for movie:", movie.poster)
                }
        return cell
    }
    
    
}

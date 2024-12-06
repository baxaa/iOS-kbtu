//
//  ViewController.swift
//  Assignment8
//
//  Created by Baqbergen Onalbekov on 16.11.2024.
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
            Movie(title: "Avengers", year: "2012", genre: "Action", poster: "Avengers.jpg"),
            Movie(title: "Pirates of the Caribbean", year: "2007", genre: "Fantasy", poster: "Pirates.jpg"),
            Movie(title: "Inception", year: "2010", genre: "Sci-Fi", poster: "Inception.jpg"),
            Movie(title: "Inception", year: "2010", genre: "Sci-Fi", poster: "Inception.jpg"),
            Movie(title: "Inception", year: "2010", genre: "Sci-Fi", poster: "Inception.jpg"),
            Movie(title: "Avengers", year: "2012", genre: "Action", poster: "Avengers.jpg"),
            Movie(title: "Pirates of the Caribbean", year: "2007", genre: "Fantasy", poster: "Pirates.jpg"),
            Movie(title: "Inception", year: "2010", genre: "Sci-Fi", poster: "Inception.jpg"),
            Movie(title: "Avengers", year: "2012", genre: "Action", poster: "Avengers.jpg"),
            Movie(title: "Pirates of the Caribbean", year: "2007", genre: "Fantasy", poster: "Pirates.jpg"),
            Movie(title: "Inception", year: "2010", genre: "Sci-Fi", poster: "Inception.jpg"),

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
        TableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyBoard.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            let movie = movies[indexPath.row]
            vc.navigationItem.title = movie.title
            vc.posterTxt = movie.poster
            vc.genreTxt = movie.genre
            vc.titleTxt = movie.title
            vc.yearTxt = movie.year
            navigationController?.pushViewController(vc, animated: true)
        }
        
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        
        let movie = movies[indexPath.row]
        print("Configuring cell for movie:", movie)
        cell.myImage.image = UIImage(named: movie.poster)
        cell.myYear.text = movie.year
        cell.myTitle.text = movie.title
        return cell
    }
    
    
}

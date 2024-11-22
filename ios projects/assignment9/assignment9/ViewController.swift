//
//  ViewController.swift
//  assignment9
//
//  Created by Baqbergen Onalbekov on 17.11.2024.
//

import UIKit



class ViewController: UIViewController {
    

    @IBOutlet weak var MovieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieTableView.rowHeight = UITableView.automaticDimension
        MovieTableView.dataSource = self
        MovieTableView.delegate = self
        print(MovieTableView.isScrollEnabled)
        MovieTableView.isScrollEnabled = true
        MovieTableView.isUserInteractionEnabled = true
        print("Content Size: \(MovieTableView.contentSize)")
        print("Frame Size: \(MovieTableView.frame.size)")

    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "detailView") as? DetailViewController {
            let books = DataProvider.shared.getItems(for: .movies)
            vc.titleTxt = books[indexPath.row].title
            vc.imgTxt = books[indexPath.row].imageName
            vc.descri = books[indexPath.row].description
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataProvider.shared.getItems(for: .movies).count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! CustomTableViewCell
        let books = DataProvider.shared.getItems(for: .movies)
        cell.TitleLbl.text = books[indexPath.row].title
    
        return cell
    }
    
}


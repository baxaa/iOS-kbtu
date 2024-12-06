//
//  MusicViewController.swift
//  assignment9
//
//  Created by Baqbergen Onalbekov on 17.11.2024.
//

import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var MusicTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MusicTableView.rowHeight = UITableView.automaticDimension
        MusicTableView.estimatedRowHeight = 150
        MusicTableView.dataSource = self
        MusicTableView.delegate = self
    }
}

extension MusicViewController: UITableViewDataSource, UITableViewDelegate {
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
        return DataProvider.shared.getItems(for: .music).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! CustomTableViewCell
        print("Configuring cell for row: \(indexPath.row)")
        if tableView == MusicTableView {
            let books = DataProvider.shared.getItems(for: .music)
            cell.TitleLbl.text = books[indexPath.row].title
            cell.yearLBL.text = books[indexPath.row].releaseDate
            cell.imgLbl.image = UIImage(named: books[indexPath.row].imageName)
        }
        return cell
    }
    
    
}

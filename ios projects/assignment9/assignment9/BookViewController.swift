//
//  BookViewController.swift
//  assignment9
//
//  Created by Baqbergen Onalbekov on 17.11.2024.
//

import UIKit

class BookViewController: UIViewController {
    @IBOutlet weak var BookTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        BookTableView.dataSource = self
        BookTableView.delegate = self
        BookTableView.rowHeight = UITableView.automaticDimension
        BookTableView.estimatedRowHeight = 100
        print("Frame Size: \(BookTableView.frame.size)")
        print("Content Size: \(BookTableView.contentSize)")

    }

}
extension BookViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "detailView") as? DetailViewController {
            let books = DataProvider.shared.getItems(for: .books)
            vc.titleTxt = books[indexPath.row].title
            vc.imgTxt = books[indexPath.row].imageName
            vc.descri = books[indexPath.row].description
//            navigationController?.pushViewController(vc, animated: true)
            navigationController?.show(vc, sender: nil)
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == BookTableView {
            return DataProvider.shared.getItems(for: .books).count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! CustomTableViewCell
        print("Configuring cell for row: \(indexPath.row)")
        if tableView == BookTableView {
            let books = DataProvider.shared.getItems(for: .books)
            cell.TitleLbl.text = books[indexPath.row].title
            cell.yearLBL.text = books[indexPath.row].releaseDate
            cell.imgLbl.image = UIImage(named: books[indexPath.row].imageName)
        }
        return cell
        
    }
    
    
}

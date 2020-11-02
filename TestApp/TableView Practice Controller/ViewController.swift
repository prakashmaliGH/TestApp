//
//  ViewController.swift
//  TestApp
//
//  Created by Prakash Mali on 11/2/20.
//  Copyright © 2020 Prakash Mali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let MovieData = [
      ["title": "Jason Bourne", "cast": "Matt Damon, Alicia Vikander, Julia Stiles", "genre": "action"],
      ["title": "Suicide Squad", "cast": "Margot Robbie, Jared Leto, Will Smith", "genre": "action"],
      ["title": "Star Trek Beyond", "cast": "Chris Pine, Zachary Quinto, Zoe Saldana", "genre": "action"],
      ["title": "Deadpool", "cast": "Ryan Reynolds, Morena Baccarin, Gina Carano", "genre": "action"],
      ["title": "London Has Fallen", "cast": "Gerard Butler, Aaron Eckhart, Morgan Freeman, Angela Bassett", "genre": "action"],
      ["title": "Ghostbusters", "cast": "Kate McKinnon, Leslie Jones, Melissa McCarthy, Kristen Wiig", "genre": "comedy"],
      ["title": "Central Intelligence", "cast": "Dwayne Johnson, Kevin Hart", "genre": "comedy"],
      ["title": "Bad Moms", "cast": "Mila Kunis, Kristen Bell, Kathryn Hahn, Christina Applegate", "genre": "comedy"],
      ["title": "Keanu", "cast": "Jordan Peele, Keegan-Michael Key", "genre": "comedy"],
      ["title": "Neighbors 2: Sorority Rising", "cast": "Seth Rogen, Rose Byrne", "genre": "comedy"],
      ["title": "The Shallows", "cast": "Blake Lively", "genre": "drama"],
      ["title": "The Finest Hours", "cast": "Chris Pine, Casey Affleck, Holliday Grainger", "genre": "drama"],
      ["title": "10 Cloverfield Lane", "cast": "Mary Elizabeth Winstead, John Goodman, John Gallagher Jr.", "genre": "drama"],
      ["title": "A Hologram for the King", "cast": "Tom Hanks, Sarita Choudhury", "genre": "drama"],
      ["title": "Miracles from Heaven", "cast": "Jennifer Garner, Kylie Rogers, Martin Henderson", "genre": "drama"],
      ["title": "Jason Bourne", "cast": "Matt Damon, Alicia Vikander, Julia Stiles", "genre": "indie"]
    ]
    
    enum TableSection: Int {
      case action = 0, comedy, drama, indie, total
    }
    
    let sectionHeaderHeight: CGFloat = 25
    
    var data = [TableSection: [[String: String]]]()

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        sortData()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func sortData() {
      data[.action] = MovieData.filter({ $0["genre"] == "action" })
      data[.comedy] = MovieData.filter({ $0["genre"] == "comedy" })
      data[.drama] = MovieData.filter({ $0["genre"] == "drama" })
      data[.indie] = MovieData.filter({ $0["genre"] == "indie" })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
 
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.total.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableSection = TableSection(rawValue: section), let movieData = data[tableSection]{
            return movieData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let tableSection = TableSection(rawValue: section), let movieData = data[tableSection], movieData.count > 0 {
          return sectionHeaderHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: sectionHeaderHeight))
        view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: sectionHeaderHeight))
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textAlignment = .center
        label.textColor = UIColor.systemTeal
        if let tableSection = TableSection(rawValue: section) {
          switch tableSection {
          case .action:
            label.text = "Action"
          case .comedy:
            label.text = "Comedy"
          case .drama:
            label.text = "Drama"
          case .indie:
            label.text = "Indie"
          default:
            label.text = ""
          }
        }
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath)
         if let tableSection = TableSection(rawValue: indexPath.section), let movie = data[tableSection]?[indexPath.row] {
           if let titleLabel = cell.viewWithTag(10) as? UILabel {
             titleLabel.text = movie["title"]
           }
           if let subtitleLabel = cell.viewWithTag(20) as? UILabel {
             subtitleLabel.text = movie["cast"]
           }
         }
         return cell
     }
}

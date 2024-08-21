//
//  ViewController.swift
//  EmojiDictionary
//
//  Created by Tanishk Sahni on 17/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    let data = emojis
    
    var tableView: UITableView = {
        let table = UITableView()
        
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Emoji Dictionary"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode =  .always
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(EmojiTableViewCell.self, forCellReuseIdentifier: EmojiTableViewCell.identifier)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmojiTableViewCell.identifier, for: indexPath) as! EmojiTableViewCell
        let emoji = data[indexPath.row]
        cell.configure(with: emoji)
        return cell
    }
    
}


extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

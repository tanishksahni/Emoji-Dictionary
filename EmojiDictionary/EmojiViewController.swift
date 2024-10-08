//
//  ViewController.swift
//  EmojiDictionary
//
//  Created by Tanishk Sahni on 17/08/24.
//

import UIKit

class EmojiViewController: UIViewController {
    
    var data = emojis
    var isEditingEmoji: Bool = false
    
    var tableView: UITableView = {
        let table = UITableView()
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Emoji Dictionary"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(EmojiTableViewCell.self, forCellReuseIdentifier: EmojiTableViewCell.identifier)
    }
    
    @objc func addButtonTapped() {
        let addEmojiVC = AddEmojiViewController()
        addEmojiVC.delegate = self
        let navController = UINavigationController(rootViewController: addEmojiVC)
        present(navController, animated: true, completion: nil)
        
    }
}

extension EmojiViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmojiTableViewCell.identifier, for: indexPath) as! EmojiTableViewCell
        let emoji = data[indexPath.row]
        cell.configure(with: emoji)
        
        cell.showsReorderControl = true
        return cell
    }
    
}

extension EmojiViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
    }
    
}



extension EmojiViewController {
    @objc func editButtonTapped() {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
        navigationItem.rightBarButtonItem?.title = tableView.isEditing ? "Done" : "Edit"
    }
}



extension EmojiViewController: AddEmojiViewControllerDelegate {
    func didAddEmoji(_ emoji: Emoji) {
        data.append(emoji)
        tableView.reloadData()
    }
}

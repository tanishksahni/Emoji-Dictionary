//
//  AddEmojiViewController.swift
//  EmojiDictionary
//
//  Created by Tanishk Sahni on 22/08/24.
//

import UIKit

protocol AddEmojiViewControllerDelegate: AnyObject {
    func didAddEmoji(_ emoji: Emoji)
}

class AddEmojiViewController: UIViewController {
    
    weak var delegate: AddEmojiViewControllerDelegate?
    
    var emojiTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Emoji"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Description"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var usageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Usage"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Add Emoji"
        
        view.addSubview(emojiTextField)
        view.addSubview(nameTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(usageTextField)

        NSLayoutConstraint.activate([
//            emojiTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            emojiTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emojiTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            emojiTextField.heightAnchor.constraint(equalToConstant: 34),
            
            nameTextField.topAnchor.constraint(equalTo: emojiTextField.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            nameTextField.heightAnchor.constraint(equalToConstant: 34),
            
            descriptionTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 34),
            
            usageTextField.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20),
            usageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            usageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            usageTextField.heightAnchor.constraint(equalToConstant: 34),
            
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveEmoji))
    }
    
    @objc func saveEmoji() {
        guard let symbol = emojiTextField.text,
              let name = nameTextField.text,
              let description = descriptionTextField.text,
              let usage = usageTextField.text else { return }
        
        let newEmoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
        delegate?.didAddEmoji(newEmoji)
        dismiss(animated: true, completion: nil)
    }
}

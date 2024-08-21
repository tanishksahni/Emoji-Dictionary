//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Tanishk Sahni on 21/08/24.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    static let identifier = "EmojiTableViewCell"
    
    var primaryText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    var secondaryText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(primaryText)
        contentView.addSubview(secondaryText)
        
        NSLayoutConstraint.activate([
            
            primaryText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            primaryText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            primaryText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            
            secondaryText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            secondaryText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            secondaryText.topAnchor.constraint(equalTo: primaryText.bottomAnchor, constant: 4),
            secondaryText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with emoji: Emoji) {
            primaryText.text = "\(emoji.symbol) ~ \(emoji.name)"
            secondaryText.text = emoji.description
    }
}

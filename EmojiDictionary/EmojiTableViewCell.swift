//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Tanishk Sahni on 21/08/24.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    static let identifier = "EmojiTableViewCell"
    
    var emojiSymbol: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
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
        
        let contentStackView = UIStackView()
        contentStackView.axis = .horizontal
        contentStackView.spacing = 8
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let textStackView = UIStackView()
        textStackView.axis = .vertical
        textStackView.spacing = 4
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(emojiSymbol)
        contentStackView.addArrangedSubview(textStackView)
        
        textStackView.addArrangedSubview(primaryText)
        textStackView.addArrangedSubview(secondaryText)
        
        NSLayoutConstraint.activate([
            
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            emojiSymbol.widthAnchor.constraint(equalToConstant: 40),
            
            textStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with emoji: Emoji) {
        emojiSymbol.text = emoji.symbol
        primaryText.text = emoji.name
        secondaryText.text = emoji.description
    }
}

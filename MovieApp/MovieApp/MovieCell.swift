//
//  MovieCell.swift
//  MovieApp
//
//  Created by Damir Nuriev on 18.07.2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    var nameLabel = UILabel()
    var posterView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.contentView.addSubview(posterView)
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.contentMode = .scaleAspectFit
        //posterView.layer.cornerRadius = 30
        
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .center
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            posterView.widthAnchor.constraint(equalToConstant: 128),
            posterView.heightAnchor.constraint(equalToConstant: 190),
            posterView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            nameLabel.widthAnchor.constraint(equalToConstant: 128),
            nameLabel.heightAnchor.constraint(equalToConstant: 25),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 190),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}

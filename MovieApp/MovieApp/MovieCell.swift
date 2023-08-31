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
    var overviewLabel = UILabel()
    var voteAverageLabel = UILabel()
    var voteStarView = UIImageView()
    
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
        
        self.contentView.addSubview(voteStarView)
        voteStarView.translatesAutoresizingMaskIntoConstraints = false
        voteStarView.contentMode = .scaleAspectFill
        
        self.contentView.addSubview(voteAverageLabel)
        voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
        voteAverageLabel.contentMode = .scaleAspectFill
        voteAverageLabel.textColor = .black
        voteAverageLabel.textAlignment = .left
        
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.contentMode = .scaleAspectFill
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .center
        nameLabel.lineBreakMode = .byWordWrapping
        
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            posterView.widthAnchor.constraint(equalToConstant: 180),
            posterView.heightAnchor.constraint(equalToConstant: 275),
            posterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            //posterView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterView.topAnchor.constraint(equalTo: contentView.topAnchor),
            //posterView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -65),
            
            voteStarView.heightAnchor.constraint(equalToConstant: 15),
            voteStarView.widthAnchor.constraint(equalToConstant: 15),
            voteStarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 75),
            //voteStarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -90),
            voteStarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 275),
            //voteStarView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            voteAverageLabel.heightAnchor.constraint(equalToConstant: 15),
            voteAverageLabel.widthAnchor.constraint(equalToConstant: 90),
            voteAverageLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -90),
            //voteAverageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 75),
            voteAverageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 275),
            //voteAverageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            nameLabel.widthAnchor.constraint(equalToConstant: 180),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 290),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

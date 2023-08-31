//
//  MovieInformationViewController.swift
//  MovieApp
//
//  Created by Damir Nuriev on 25.08.2023.
//

import UIKit

class MovieInformationViewController: UIViewController {
    
    var posterView = UIImageView()
    var nameLabel = UILabel()
    var overviewLabel = UILabel()
    var voteAverageLabel = UILabel()
    var voteStarView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .yellow
    }
    
    func setup() {
        view.addSubview(posterView)
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.contentMode = .scaleAspectFit
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.contentMode = .scaleAspectFill
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .center
        nameLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.contentMode = .scaleAspectFill
        overviewLabel.textColor = .black
        overviewLabel.numberOfLines = 0
        overviewLabel.textAlignment = .left
        overviewLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(voteAverageLabel)
        voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
        voteAverageLabel.contentMode = .scaleAspectFill
        voteAverageLabel.textColor = .black
        voteAverageLabel.textAlignment = .left
        
        view.addSubview(voteStarView)
        voteStarView.translatesAutoresizingMaskIntoConstraints = false
        voteStarView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            posterView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            posterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            posterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            voteStarView.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 5),
            voteStarView.bottomAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 30),
            voteStarView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            voteStarView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            
            voteAverageLabel.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 5),
            voteAverageLabel.bottomAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 30),
            voteAverageLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            voteAverageLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: voteStarView.bottomAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: voteStarView.bottomAnchor, constant: 65),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            overviewLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
}

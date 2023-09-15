//
//  MovieInformationViewController.swift
//  MovieApp
//
//  Created by Damir Nuriev on 25.08.2023.
//

import UIKit

class MovieInformationViewController: UIViewController {
    
    let posterView = UIImageView()
    let backdropView = UIImageView()
    let nameLabel = UILabel()
    let overviewLabel = UILabel()
    let voteAverageLabel = UILabel()
    let voteStarView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.bringSubviewToFront(posterView)
        view.backgroundColor = .white
    }
    
    func setup() {
        view.addSubview(posterView)
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.contentMode = .scaleAspectFit
        
        view.addSubview(backdropView)
        backdropView.translatesAutoresizingMaskIntoConstraints = false
        backdropView.contentMode = .scaleAspectFill
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.contentMode = .scaleAspectFill
        nameLabel.textColor = .black
        nameLabel.font = R.Fonts.helvelticaRegular(with: 24)
        nameLabel.numberOfLines = 0
        nameLabel.sizeToFit()
        nameLabel.textAlignment = .center
        nameLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.contentMode = .scaleAspectFill
        overviewLabel.textColor = .black
        overviewLabel.font = R.Fonts.helvelticaRegular(with: 14)
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
            posterView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            posterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            posterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backdropView.topAnchor.constraint(equalTo: view.topAnchor),
            backdropView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            backdropView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backdropView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: posterView.bottomAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 60),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
//            voteStarView.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 5),
//            voteStarView.bottomAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 30),
//            voteStarView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
//            voteStarView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
//
//            voteAverageLabel.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 5),
//            voteAverageLabel.bottomAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 30),
//            voteAverageLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
//            voteAverageLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            
            overviewLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
}

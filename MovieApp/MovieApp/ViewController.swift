//
//  ViewController.swift
//  MovieApp
//
//  Created by Damir Nuriev on 5.06.2023.
//

import UIKit

class ViewController: UIViewController {
    //static let shared = ViewController()
    
    var collectionView: UICollectionView!
    var movieModels: [MovieListModel] = []
    var posterImages: [UIImage] = []
    var voteStar = "star"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthManager.shared.makeGuestSessionRequest { _ in

        }

        AuthManager.shared.getMovieList { response in
            self.movieModels = response!.results
            self.downloadPosterImages()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setupCollectionView()
        }
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalToConstant: 180),
            collectionView.heightAnchor.constraint(equalToConstant: 275),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])

        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "\(MovieCell.self)")
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        
        return layout
    }
    
    func downloadPosterImages() {
        for element in movieModels {
            let url = URL(string: "https://image.tmdb.org/t/p/w200\(element.posterPath)")
            
            let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
                if data != nil, error == nil {
                    DispatchQueue.main.async {
                        self.posterImages.append(UIImage(data: data!)!)
                        print("image will be append")
                    }
                }
            }
            dataTask.resume()
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(MovieCell.self)",
            for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        cell.nameLabel.text = movieModels[indexPath.item].title
        cell.voteAverageLabel.text = String(movieModels[indexPath.item].voteAverage)
        cell.voteStarView.image = UIImage(systemName: voteStar)
        cell.posterView.image = posterImages[indexPath.item]
        return cell
    }
}

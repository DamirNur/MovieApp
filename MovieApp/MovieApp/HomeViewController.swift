//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Damir Nuriev on 5.06.2023.
//

import UIKit

class HomeViewController: UIViewController {
    var collectionView: UICollectionView!
    var movieModels: [MovieListModel] = []
    var posterImagesArray: [String: UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthManager.shared.makeGuestSessionRequest { _ in }

        AuthManager.shared.getMovieList { response in
            self.movieModels = response!.results
            DispatchQueue.main.sync {
                self.setupCollectionView()
            }
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

        collectionView.delegate = self
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
    
    private func downloadPosterImage(urlEnd: String, onComplete: @escaping (UIImage) -> Void) {
        let url = URL(string: "https://image.tmdb.org/t/p/w200\(urlEnd)")
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data)
            else { return }
            self.posterImagesArray["\(urlEnd)"] = image
            print("Image will be append")
            
            onComplete(image)
        }
        dataTask.resume()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieInformationVC = MovieInformationViewController()
        
        movieInformationVC.posterView.image = posterImagesArray[movieModels[indexPath.item].posterPath]
        movieInformationVC.voteStarView.image = UIImage(systemName: "star")
        movieInformationVC.voteAverageLabel.text = String(movieModels[indexPath.item].voteAverage)
        movieInformationVC.nameLabel.text = movieModels[indexPath.item].title
        movieInformationVC.overviewLabel.text = movieModels[indexPath.item].overview
        
        navigationController?.pushViewController(movieInformationVC, animated: true)
    }
    
    //MARK: - UICollectionViewDataSource
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
        cell.voteStarView.image = UIImage(systemName: "star")
        
        let imageUrl = movieModels[indexPath.item].posterPath
        downloadPosterImage(urlEnd: imageUrl) { image in
            DispatchQueue.main.sync {
                cell.posterView.image = image
            }
        }
        return cell
    }
}

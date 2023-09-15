//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Damir Nuriev on 5.06.2023.
//

import UIKit

class HomeViewController: UIViewController {
    var collectionView: UICollectionView!
    var popularMovieModel: [MovieListModel] = []
    var nowPlayingMovieModel: [NowPlayingListModel] = []
    var topRatedMovieModel: [TopRatedListModel] = []
    var upcomingMovieModel: [UpcomingListModel] = []
    var moviePosterImagesDictionary: [String: UIImage] = [:]
    var movieBackdropImagesDictionary: [String: UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
		let downloadGroup = DispatchGroup()

		downloadGroup.enter()
        AuthManager.shared.makeGuestSessionRequest { _ in
			downloadGroup.leave()
		}

		downloadGroup.enter()
        AuthManager.shared.getNowPlayingList { response in
            self.nowPlayingMovieModel = response!.results
			downloadGroup.leave()
        }

		downloadGroup.enter()
        AuthManager.shared.getPopularList { response in
            self.popularMovieModel = response!.results
			downloadGroup.leave()
        }

		downloadGroup.enter()
        AuthManager.shared.getTopRatedList { response in
            self.topRatedMovieModel = response!.results
			downloadGroup.leave()
        }

		downloadGroup.enter()
        AuthManager.shared.getUpcomingList { response in
            self.upcomingMovieModel = response!.results
			downloadGroup.leave()
        }

		downloadGroup.notify(queue: DispatchQueue.main) {
			self.setupCollectionView()
		}
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: createCompositionalLayout())

        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "\(MovieCell.self)")
        collectionView.register(HomeVCSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeVCSectionHeader.headerId)
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let nowPlayingSection = createNowPlayingSectionLayout()
        let popularSection = createPopularSectionSectionLayout()
        let topRatedSection = createTopRatedSectionSectionLayout()
        let upcomingSection = createUpcomingSectionSectionLayout()
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return nowPlayingSection
            } else if sectionIndex == 1 {
                return popularSection
            } else if sectionIndex == 2 {
                return topRatedSection
            } else {
                return upcomingSection
            }
        }
        return layout
    }
    
    func createNowPlayingSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(128),
                                              heightDimension: .absolute(215))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(138),
                                               heightDimension: .absolute(215))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func createPopularSectionSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(128),
                                              heightDimension: .absolute(215))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(138),
                                               heightDimension: .absolute(215))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func createTopRatedSectionSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(128),
                                              heightDimension: .absolute(215))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(138),
                                               heightDimension: .absolute(215))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func createUpcomingSectionSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(128),
                                              heightDimension: .absolute(215))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(138),
                                               heightDimension: .absolute(215))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func downloadPosterImage(urlEnd: String, onComplete: @escaping (UIImage) -> Void) {
        let url = URL(string: "https://image.tmdb.org/t/p/w400\(urlEnd)")
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data)
            else { return }
            self.moviePosterImagesDictionary["\(urlEnd)"] = image
            print("Image will be append")
            
            onComplete(image)
        }
        dataTask.resume()
    }
    
    private func downloadBackdropImage(urlEnd: String, onComplete: @escaping (UIImage) -> Void) {
        let url = URL(string: "https://image.tmdb.org/t/p/w400\(urlEnd)")
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data)
            else { return }
            self.movieBackdropImagesDictionary["\(urlEnd)"] = image
            print("Image will be append")
            
            onComplete(image)
        }
        dataTask.resume()
    }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let movieInformationVC = MovieInformationViewController()
        
        if indexPath.section == 0 {
            movieInformationVC.posterView.image = moviePosterImagesDictionary[nowPlayingMovieModel[indexPath.item].posterPath]
            let imageUrl = nowPlayingMovieModel[indexPath.item].backdropPath
			downloadBackdropImage(urlEnd: imageUrl) { image in
                DispatchQueue.main.sync {
                    movieInformationVC.backdropView.image = image
                }
            }
            movieInformationVC.voteStarView.image = R.Images.Common.ratingStar
            movieInformationVC.voteAverageLabel.text = String(nowPlayingMovieModel[indexPath.item].voteAverage)
            movieInformationVC.nameLabel.text = nowPlayingMovieModel[indexPath.item].title
            movieInformationVC.overviewLabel.text = nowPlayingMovieModel[indexPath.item].overview
        } else if indexPath.section == 1 {
            movieInformationVC.posterView.image = moviePosterImagesDictionary[popularMovieModel[indexPath.item].posterPath]
            let imageUrl = popularMovieModel[indexPath.item].backdropPath
            downloadPosterImage(urlEnd: imageUrl) { image in
                DispatchQueue.main.sync {
                    movieInformationVC.backdropView.image = image
                }
            }
            movieInformationVC.voteStarView.image = R.Images.Common.ratingStar
            movieInformationVC.voteAverageLabel.text = String(popularMovieModel[indexPath.item].voteAverage)
            movieInformationVC.nameLabel.text = popularMovieModel[indexPath.item].title
            movieInformationVC.overviewLabel.text = popularMovieModel[indexPath.item].overview
        } else if indexPath.section == 2 {
            movieInformationVC.posterView.image = moviePosterImagesDictionary[topRatedMovieModel[indexPath.item].posterPath]
            let imageUrl = topRatedMovieModel[indexPath.item].backdropPath
            downloadPosterImage(urlEnd: imageUrl) { image in
                DispatchQueue.main.sync {
                    movieInformationVC.backdropView.image = image
                }
            }
            movieInformationVC.voteStarView.image = R.Images.Common.ratingStar
            movieInformationVC.voteAverageLabel.text = String(topRatedMovieModel[indexPath.item].voteAverage)
            movieInformationVC.nameLabel.text = topRatedMovieModel[indexPath.item].title
            movieInformationVC.overviewLabel.text = topRatedMovieModel[indexPath.item].overview
        } else {
            movieInformationVC.posterView.image = moviePosterImagesDictionary[upcomingMovieModel[indexPath.item].posterPath]
            let imageUrl = upcomingMovieModel[indexPath.item].backdropPath
            downloadPosterImage(urlEnd: imageUrl) { image in
                DispatchQueue.main.sync {
                    movieInformationVC.backdropView.image = image
                }
            }
            movieInformationVC.voteStarView.image = R.Images.Common.ratingStar
            movieInformationVC.voteAverageLabel.text = String(upcomingMovieModel[indexPath.item].voteAverage)
            movieInformationVC.nameLabel.text = upcomingMovieModel[indexPath.item].title
            movieInformationVC.overviewLabel.text = upcomingMovieModel[indexPath.item].overview
        }
        navigationController?.pushViewController(movieInformationVC, animated: true)
    }
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return nowPlayingMovieModel.count
        } else if section == 1 {
            return popularMovieModel.count
        } else if section == 2 {
            return topRatedMovieModel.count
        } else {
            return upcomingMovieModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "\(MovieCell.self)",
                for: indexPath) as? MovieCell else {
                return UICollectionViewCell()
            }
            cell.nameLabel.text = nowPlayingMovieModel[indexPath.item].title
            
            let imageUrl = nowPlayingMovieModel[indexPath.item].posterPath
            downloadPosterImage(urlEnd: imageUrl) { image in
                DispatchQueue.main.sync {
                    cell.posterView.image = image
                }
            }
            
            return cell
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "\(MovieCell.self)",
                for: indexPath) as? MovieCell else {
                return UICollectionViewCell()
            }
            cell.nameLabel.text = popularMovieModel[indexPath.item].title
            
            let imageUrl = popularMovieModel[indexPath.item].posterPath
            downloadPosterImage(urlEnd: imageUrl) { image in
                DispatchQueue.main.sync {
                    cell.posterView.image = image
                }
            }
            
            return cell
        } else if indexPath.section == 2 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "\(MovieCell.self)",
                for: indexPath) as? MovieCell else {
                return UICollectionViewCell()
            }
            cell.nameLabel.text = topRatedMovieModel[indexPath.item].title
            
            let imageUrl = topRatedMovieModel[indexPath.item].posterPath
            downloadPosterImage(urlEnd: imageUrl) { image in
                DispatchQueue.main.sync {
                    cell.posterView.image = image
                }
            }
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "\(MovieCell.self)",
                for: indexPath) as? MovieCell else {
                return UICollectionViewCell()
            }
            cell.nameLabel.text = upcomingMovieModel[indexPath.item].title
            
            let imageUrl = upcomingMovieModel[indexPath.item].posterPath
            downloadPosterImage(urlEnd: imageUrl) { image in
                DispatchQueue.main.sync {
                    cell.posterView.image = image
                }
            }
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HomeVCSectionHeader.headerId,
            for: indexPath) as! HomeVCSectionHeader
        if indexPath.section == 0 {
            header.title.text = R.Strings.Section.nowPlaying
        } else if indexPath.section == 1 {
            header.title.text = R.Strings.Section.popular
        } else if indexPath.section == 2 {
            header.title.text = R.Strings.Section.topRated
        } else {
            header.title.text = R.Strings.Section.upcoming
        }
        return header
    }
}

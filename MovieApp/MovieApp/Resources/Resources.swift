//
//  Resources.swift
//  MovieApp
//
//  Created by Damir Nuriev on 12.09.2023.
//

import UIKit

enum R {
    enum Strings {
        enum TabBar {
            static let home = "Home"
            static let search = "Search"
        }
        
        enum Section {
            static let nowPlaying = "Now Playing"
            static let popular = "Popular"
            static let topRated = "Top Rated"
            static let upcoming = "Upcoming"
        }
    }
    
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    enum Images {
        enum Common {
            static let ratingStar = UIImage(systemName: "star.fill")
            static let rightArrow = UIImage(systemName: "chevron.forward")
        }
        
        enum TabBar {
            static let home = UIImage(systemName: "house.fill")
            static let search = UIImage(systemName: "magnifyingglass")
        }
    }
    
    enum Colors {
        static let mainBackground = UIColor(red: 56, green: 57, blue: 80, alpha: 0)
    }
}

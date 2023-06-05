//
//  ViewController.swift
//  MovieApp
//
//  Created by Damir Nuriev on 5.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(welcomeLabel)
    }
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Hello"
        label.textColor = .white
        label.frame = CGRect(x: 150, y: 350, width: 50, height: 50)
        return label
    }()
}


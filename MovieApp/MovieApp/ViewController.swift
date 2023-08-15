//
//  ViewController.swift
//  MovieApp
//
//  Created by Damir Nuriev on 5.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Hello"
        label.textColor = .white
        label.frame = CGRect(x: 150, y: 350, width: 50, height: 50)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(welcomeLabel)
    }
}


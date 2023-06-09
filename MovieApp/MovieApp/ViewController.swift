//
//  ViewController.swift
//  MovieApp
//
//  Created by Damir Nuriev on 5.06.2023.
//

import UIKit

class ViewController: UIViewController {
    static let shared = ViewController()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Hello"
        label.textColor = .white
        label.frame = CGRect(x: 50, y: 50, width: 500, height: 500)
        label.numberOfLines = .zero
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(welcomeLabel)
        
        AuthManager.shared.makeRequest { responseModel in
            DispatchQueue.main.async {
                self.welcomeLabel.text = responseModel.debugDescription
            }
        }
    }
}

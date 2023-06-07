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
        makeRequest()
    }
    
    private func makeRequest() {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTMxMDY2YTY2OTZlZmI3M2FjYWY4YmQ3OWIyNTgwMyIsInN1YiI6IjY0N2YwNDMxMGUyOWEyMmJlMWYxMTdhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AwH5jmQYKL2Xyo8zjRvWNpb5N7J2Clin39WxYKNB8Qc"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/authentication/guest_session/new")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
          }
        })

        dataTask.resume()
    }
}

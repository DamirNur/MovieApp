//
//  AuthManager.swift
//  MovieApp
//
//  Created by Damir Nuriev on 6.06.2023.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct APIConstants {
        static let apiKey = "b931066a6696efb73acaf8bd79b25803"
        static let apiAccessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTMxMDY2YTY2OTZlZmI3M2FjYWY4YmQ3OWIyNTgwMyIsInN1YiI6IjY0N2YwNDMxMGUyOWEyMmJlMWYxMTdhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AwH5jmQYKL2Xyo8zjRvWNpb5N7J2Clin39WxYKNB8Qc"
        
    }
    
    func makeRequest() {
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
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error -> Void in
            guard let data = data, error == nil else {
                return
            }
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = try? JSONDecoder().decode(GuestSessionResponse.self, from: data)
                print(httpResponse)
            } 
        })
        
        dataTask.resume()
    }
}

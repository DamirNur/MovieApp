//
//  AuthManager.swift
//  MovieApp
//
//  Created by Damir Nuriev on 6.06.2023.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    let headers = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTMxMDY2YTY2OTZlZmI3M2FjYWY4YmQ3OWIyNTgwMyIsInN1YiI6IjY0N2YwNDMxMGUyOWEyMmJlMWYxMTdhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AwH5jmQYKL2Xyo8zjRvWNpb5N7J2Clin39WxYKNB8Qc"
    ]
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
        return decoder
    }()
    
    struct APIConstants {
        static let apiKey = "b931066a6696efb73acaf8bd79b25803"
        static let apiAccessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTMxMDY2YTY2OTZlZmI3M2FjYWY4YmQ3OWIyNTgwMyIsInN1YiI6IjY0N2YwNDMxMGUyOWEyMmJlMWYxMTdhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AwH5jmQYKL2Xyo8zjRvWNpb5N7J2Clin39WxYKNB8Qc"
        
    }
    
    //Guest session
    func makeGuestSessionRequest(completion: @escaping (GuestSessionResponseModel?) -> Void) {
        
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
                let result = try? self.decoder.decode(GuestSessionResponseModel.self, from: data)
                completion(result)
            }
        })
        
        dataTask.resume()
    }
    
    //Movie list
    func getMovieList(completion: @escaping (CommonListResponseModel<MovieListModel>?) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/discover/movie")! as URL,
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
                let result = try? self.decoder.decode(CommonListResponseModel<MovieListModel>.self, from: data)
                completion(result)
            }
        })
        
        dataTask.resume()
    }
    
    //Get Movie Poster
    
    
}


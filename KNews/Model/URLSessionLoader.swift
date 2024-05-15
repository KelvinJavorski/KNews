//
//  URLSessionLoader.swift
//  KNews
//
//  Created by Kelvin Javorski Soares on 15/05/24.
//

import Foundation

import Foundation

struct URLSessionLoader: NewsLoader {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}


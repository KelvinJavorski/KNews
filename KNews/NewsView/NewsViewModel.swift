//
//  NewsViewModel.swift
//  KNews
//
//  Created by Kelvin Javorski Soares on 15/05/24.
//

import Foundation
import SwiftUI

protocol NewsViewModel: ObservableObject {
    var news: [Article] { get set }
    var loader: NewsLoader { get }
    func fetchNews()
}

extension NewsViewModel {
    func fetchNews() {
        fatalError("fetchNews() must be implemented in subclasses.")
    }
}

class DefaultNewsViewModel: ObservableObject {
    @Published var news: [Article] = []
    private let loader: NewsLoader
    
    init(loader: NewsLoader) {
        self.loader = loader
    }
    
    func fetchNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&apiKey=c84e638215514dc0be569d78d049988d") else {
            return
        }
        loader.fetchData(from: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                        self.news = response.articles
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                case .failure(let error):
                    print("Failed to fetch news data: \(error)")
                }
            }
        }
    }
}

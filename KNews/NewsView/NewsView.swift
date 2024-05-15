//
//  HomeView.swift
//  KNews
//
//  Created by Kelvin Javorski Soares on 15/05/24.
//
import SwiftUI

struct NewsView: View {
    @ObservedObject var viewModel: DefaultNewsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.news) { articleViewModel in
                HStack(alignment: .center, spacing: 10) {
                    if let imageURL = articleViewModel.imageURL {
                        RemoteImage(url: imageURL)
                            .frame(width: 100, height: 100)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text(articleViewModel.title)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(articleViewModel.description ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("News")
        }
        .onAppear {
            viewModel.fetchNews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(viewModel: DefaultNewsViewModel(loader: URLSessionLoader()))
    }
}


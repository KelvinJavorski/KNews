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
            List(viewModel.news, id: \.id) { article in
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.description ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
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

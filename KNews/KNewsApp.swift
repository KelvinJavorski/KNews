//
//  KNewsApp.swift
//  KNews
//
//  Created by Kelvin Javorski Soares on 14/05/24.
//
// c84e638215514dc0be569d78d049988d

import SwiftUI

@main
struct KNewsApp: App {
    // Criar uma instância de DefaultNewsViewModel e passá-la para NewsView
    let viewModel = DefaultNewsViewModel(loader: URLSessionLoader())
    
    var body: some Scene {
        WindowGroup {
            NewsView(viewModel: viewModel)
                .onAppear {
                    viewModel.fetchNews()
                }
        }
    }
}

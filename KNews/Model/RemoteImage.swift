//
//  RemoteImage.swift
//  KNews
//
//  Created by Kelvin Javorski Soares on 15/05/24.
//

import SwiftUI

struct RemoteImage: View {
    private let url: URL
    @State private var image: UIImage?
    
    init(url: URL) {
        self.url = url
    }
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Rectangle()
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            loadImage()
        }
    }
    
    private func loadImage() {
        print("Loading image from URL:", url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error loading image:", error?.localizedDescription ?? "Unknown error")
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Response:", httpResponse.statusCode)
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    print("Image loaded successfully")
                    self.image = image
                } else {
                    print("Failed to create UIImage from data")
                }
            }
        }.resume()
    }
}

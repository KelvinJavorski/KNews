//
//  News.swift
//  KNews
//
//  Created by Kelvin Javorski Soares on 15/05/24.
//
// Imagens, autores, titulos e descrições

import Foundation

struct News: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Identifiable, Codable {
    var id: UUID {
            return UUID()
    }
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: URL
    let urlToImage: URL?
    let publishedAt: String
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String
}

struct NewsResponse: Codable {
    let articles: [Article]
}

//
//  NewsLoader.swift
//  KNews
//
//  Created by Kelvin Javorski Soares on 15/05/24.
//
import Foundation

protocol NewsLoader {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}


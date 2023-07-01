//
//  NetworkManager.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 29.06.2023.
//

import SwiftUI
import Combine

class NetworkManager: ObservableObject {
    
    func getCategories() -> AnyPublisher<[Category], Never> {
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
            return Just([Category]()).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CategoriesModel.self, decoder: JSONDecoder())
            .map(\.сategories)
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
    
    func getProducts() -> AnyPublisher<[Product], Never> {
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else {
            return Just([Product]()).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ProductsModel.self, decoder: JSONDecoder())
            .map(\.dishes)
            .share()
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}

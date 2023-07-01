//
//  ProductsModel.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 30.06.2023.
//

import Foundation

struct ProductsModel: Codable {
    var dishes: [Product]
}

struct Product: Codable, Identifiable, Hashable {
    var id: Int = 0
    var name: String = ""
    var price: Int = 0
    var weight: Int = 0
    var description: String = ""
    var image_url: String = ""
    var tegs: [String] = [""]
}

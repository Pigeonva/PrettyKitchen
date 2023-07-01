//
//  CategoriesModel.swift
//  PrettyKitchen
//
//  Created by Артур Фомин on 29.06.2023.
//

import Foundation

struct CategoriesModel: Codable {
    var сategories: [Category]
}

struct Category: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var image_url: String
}

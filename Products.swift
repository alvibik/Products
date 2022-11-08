//
//  Model.swift
//  Products
//
//  Created by albik on 08.11.2022.
//

import Foundation
//
//struct Product: Codable, Identifiable {
//    let id: Int
//    let title: String
//    let description: String
//    let price: Int
//    let discountPercentage: Double
//    let rating: Double
//    let stock: Int
//    let brand: String
//    let category: String
//    let thumbnail: String
//    let images: [String]
//}

//struct Model : Codable {
//    let id: Int
//    let userId: Int
//    let title: String
//    let completed: Bool
//}

struct Products: Codable {
    let products: [Product]
    //let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, productDescription: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case id, title
        case productDescription = "description"
        case price, discountPercentage, rating, stock, brand, category, thumbnail, images
    }
}

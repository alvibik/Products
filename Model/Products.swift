//
//  Model.swift
//  Products
//
//  Created by albik on 08.11.2022.
//

import Foundation

struct Products: Codable {
    let products: [Product]
    let total, skip, limit: Int
    
}

struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    
    

    enum CodingKeys: String, CodingKey {
        case id, title
        case description
        //case productDescription = "description"
        case price, discountPercentage, rating, stock, brand, category, thumbnail, images
    }
}

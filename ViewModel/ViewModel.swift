//
//  ViewModel.swift
//  Products
//
//  Created by albik on 08.11.2022.
//

import Foundation

final class ProductsViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    func fetchData() {
        let url = "https://dummyjson.com/products"
        //let api = "https://jsonplaceholder.typicode.com/todos"
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(Products.self, from: data)
                    DispatchQueue.main.async {
                        self.products = result.products
                    }
                } else {
                    print ("no data")
                }
            } catch (let error) {
                print (error)
            }
        } .resume()
    }
}

//
//  ContentView.swift
//  Products
//
//  Created by albik on 08.11.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ProductsViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.products, id: \.id) { product in
                
                VStack(alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: product.thumbnail)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .overlay {
                            Rectangle().stroke(.gray, lineWidth: 3)
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        VStack(alignment: .leading){
                            
                            Text("Price \(product.price) $")
                            Text("Discount:\(String(format: "%.0f",product.discountPercentage)) %")
                            Text("\(Image(systemName: "star.fill")) \(String(format: "%.2f", product.rating))")
                            Text(product.title)
                            Text(product.brand)
                            
                        }
                    }
                    
                    
                    
                }
            }
        }.onAppear(perform: {
            viewModel.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

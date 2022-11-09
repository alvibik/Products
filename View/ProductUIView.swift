//
//  ContentView.swift
//  Products
//
//  Created by albik on 08.11.2022.
//

import SwiftUI

struct ProductUIView: View {
    
    @ObservedObject var viewModel = ProductsViewModel()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .trailing){
                List (viewModel.products, id: \.id) { product in
                    NavigationLink(destination: ProductDetail(product: product)) {
                        VStack {
                            HStack {
                                AsyncImage(url: URL(string: product.thumbnail)) { image in
                                    image
                                        .resizable()
                                        .frame(maxWidth: 70, maxHeight: 70, alignment: .leading)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle().stroke(.gray, lineWidth: 2)
                                        }
                                        .shadow(radius: 3)
                                } placeholder: {
                                    ProgressView()
                                }
                                VStack (alignment: .leading){
                                    Text(product.title).bold().font(.title3)
                                    Text("Price: \(product.price)$")
                                    Text("Discount: -\(String(format:"%.0f",product.discountPercentage)) %").font(.title3)
                    
                                }
                            }
                        }
                    }
                    
                }.navigationTitle("Products")
            } .onAppear(perform: {viewModel.fetchData()})
            
        }
        
        //    var body: some View {
        //        NavigationView {
        //            NavigationLink {
        //                ProductDetail()
        //                    } label: {
        //                        ProductRow()
        //                            }
        //VStack {
        
        
        //                List(viewModel.products, id: \.id) { product in
        //                    VStack(alignment: .leading) {
        //                        HStack {
        //                            AsyncImage(url: URL(string: product.thumbnail)) { image in
        //                                image.resizable()
        //                            } placeholder: {
        //                                Color.gray
        //                            }
        //                            .overlay {
        //                                Rectangle().stroke(.gray, lineWidth: 3)
        //                            }
        //                            .frame(width: 100, height: 100)
        //                            .clipShape(RoundedRectangle(cornerRadius: 15))
        //                            VStack(alignment: .leading){
        //
        //                                Text("Price \(product.price) $")
        //                                Text("Discount:\(String(format: "%.0f",product.discountPercentage)) %")
        //                                Text("\(Image(systemName: "star.fill")) \(String(format: "%.2f", product.rating))")
        //                                Text(product.title)
        //                                Text(product.brand)
        //                                //Text(product.description)
        //                            }
        //                        }
        //                    }
        //                }
        //            }.onAppear(perform: {
        //                viewModel.fetchData()
        //            }).navigationTitle("Products")
        //}
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductUIView()
    }
}

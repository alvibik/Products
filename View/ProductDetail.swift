//
//  ProductDetail.swift
//  Products
//
//  Created by albik on 09.11.2022.
//

import SwiftUI

struct ProductDetail: View {
    
    var product: Product
    
    var body: some View {
        VStack (alignment: .leading){
            Text(product.brand).bold()
            Text(product.title).bold()
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<product.images.count) {
                        AsyncImage(url: URL(string: product.images[$0])) { image in
                            image
                                .resizable()
                                .frame(maxWidth: 300, maxHeight: 300 ,alignment: .leading)
                                .clipShape(Rectangle())
                                .cornerRadius(25)
                                .overlay {
                                    Rectangle().stroke(.white, lineWidth: 5).cornerRadius(25)
                                    
                                }
                                .shadow(radius: 15)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
            ZStack{
                Capsule()
                    .fill(LinearGradient(colors: [.gray, .white], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .frame(width: 150, height: 17)
                Text("Discount: -\(String(format:"%.0f",product.discountPercentage)) %").font(.title3)
            }
            Text("Price: \(product.price)$")
            Text(product.description)
            Spacer()
        }.padding()
    }
    
}


//struct ProductDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetail(product)
//    }
//}

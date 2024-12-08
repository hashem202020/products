//
//  ProductCard.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import SwiftUI

struct ProductCard: View {
    var product: ProductPresentationModel
    
    var body: some View {
        HStack(alignment: .center) {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: product.imageLocation)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    
                } placeholder: {
                    ProgressView()
                }.padding(.leading, 16)
                
                cardDescription
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 90)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(Color.secondary, lineWidth: 1))
    }
    
    var cardDescription: some View {
        
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.system(size: 18))
            
            Text("\(product.price) \(product.currencySymbol)")
                .font(.system(size: 14))
        }
    }
}

//
//  ProductDetailsView.swift
//  productsShop
//
//  Created by Khaled hashem on 09/12/2024.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var viewModel: ProductDetailsViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: viewModel.productDetails.imageLocation)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    detailsContent
                    
                }
                .padding(.top)
            }
            
            footerButtons
        }
        .padding(.bottom)
    }
    
    var detailsContent: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center) {
                Text(viewModel.productDetails.name)
                    .font(.system(size: 18))
                
                Spacer()
                
                HStack {
                    Text("Price: \(viewModel.productDetails.price) \(viewModel.productDetails.currencySymbol)")
                        .font(.system(size: 18))
                        .foregroundColor(.green)
                        .padding(10)
                }
                .cornerRadius(25)
                
            }
            Text(viewModel.productDetails.description)
                .font(.system(size: 14))
        }
        .padding(.horizontal, 20)
    }
    
    var footerButtons: some View {
        HStack {
            Button {
                
            } label: {
                Text("Buy Now")
                    .font(.system(size: 18))
                    .foregroundColor(.black)

            }
            .frame(width: 150, height: 70)
            
            Button {
                viewModel.toggleProductInCart()
            } label: {
                HStack {
                    Text(viewModel.addToCartText)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    
                    if let cartCount = viewModel.cartCount, cartCount != 0 {
                        Text("\(cartCount)")
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                    }
                }
            }
            .frame(width: 150, height: 50)
            .background(Color.green)

        }
        .padding(.horizontal, 16)

    }
    
}

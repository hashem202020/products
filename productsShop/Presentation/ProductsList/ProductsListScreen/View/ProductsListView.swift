//
//  ContentView.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import SwiftUI

struct ProductsListView: View {
    @StateObject var viewModel: ProductsListViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.products) { product in
                    ProductCard(product: product)
                }
            }
        }
    }
}

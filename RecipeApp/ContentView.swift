//
//  ContentView.swift
//  RecipeApp
//
//  Created by Puspank Kumar on 18/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = RecipeViewModel()

    var body: some View {
        
        if viewModel.isLoading {
            return AnyView(ActivityIndicator(style: .medium))
        } else {
            return AnyView(
                NavigationView {
                    List(viewModel.recipes, id: \.href) { recipe in
                        NavigationLink(destination: WebView(request: URLRequest(url: recipe.detail))) {
                            HStack {
                                CachedImageView(recipe.thumb)
                                .mask(Circle())
                                .frame(width: 60)
                                VStack(alignment: .leading) {
                                    Text(recipe.title)
                                        .font(.title)
                                    .lineLimit(2)
                                    Text(recipe.ingredients)
                                    .lineLimit(nil)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .navigationBarTitle("Recipe", displayMode: .inline)
                }
            )
        }
    }
}



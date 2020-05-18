//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Puspank Kumar on 18/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import Foundation

class RecipeViewModel: ObservableObject {

    @Published var recipes = [Recipe]()
    @Published var isLoading = false
    
    private let service = RecipeService()
    
    init() {
        
        loadData()
    }
    
    private func loadData() {
        
        isLoading = true
        
        service.getRecipes { [weak self] result in
            
            DispatchQueue.main.async {
                self?.isLoading = false
             
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let recipes):
                    self?.recipes = recipes
                }
            }
        }
    }

}

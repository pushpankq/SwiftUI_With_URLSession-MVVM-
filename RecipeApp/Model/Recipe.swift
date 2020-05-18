//
//  Recipe.swift
//  RecipeApp
//
//  Created by Puspank Kumar on 18/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import Foundation

struct RecipesResponse: Codable {
    
    let title: String
    let version: Double
    let href: String
    let results: [Recipe]
}

struct Recipe: Codable {
    
    let title, href, ingredients, thumbnail: String
    
    var detail: URL {
        URL(string: href)!
    }
    
    var thumb: URL {
        URL(string: thumbnail)!
    }
}

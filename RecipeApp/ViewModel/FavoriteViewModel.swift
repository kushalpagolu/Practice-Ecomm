//
//  FavoriteViewModel.swift
//  RecipeApp
//
//  Created by mt on 13.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

final class FavoriteViewModel: ObservableObject {
    
    @Published var favoriteRecipes: [WoodWorks] = []
    
    let defaults = UserDefaults.standard
    
    init() {
        let data = defaults.data(forKey: keyFavorites)
        if (data != nil) {
            favoriteRecipes = try! JSONDecoder().decode([WoodWorks].self, from: data!)
        }
    }
}

extension FavoriteViewModel {
    func addRecipeToFavorites(recipe: WoodWorks) {
        favoriteRecipes.append(recipe)
        let data = try! JSONEncoder().encode(favoriteRecipes)
        defaults.set(data, forKey: keyFavorites)
    }
    
    func removeRecipeFromFavorites(recipe: WoodWorks) {
        if let index = favoriteRecipes.firstIndex(of: recipe) {
            favoriteRecipes.remove(at: index)
        }
        let data = try! JSONEncoder().encode(favoriteRecipes)
        defaults.set(data, forKey: keyFavorites)
    }
}

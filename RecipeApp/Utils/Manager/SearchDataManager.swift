//
//  SearchDataManager.swift
//  RecipeApp
//
//  Created by muhammed on 11/12/2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import Foundation

class SearchDataManager: ObservableObject {
    
    static let shared = SearchDataManager()
    
    @Published var recipeList = [WoodWorks]()
    
    var originalRecipeList = [WoodWorks]()
    
    func setOriginalList(list:[WoodWorks]) {
        self.originalRecipeList = list
        self.recipeList = list
    }
    
    func resetToOriginal() {
        if recipeList.count != originalRecipeList.count {
            recipeList = originalRecipeList
        }
    }
    
    func setEmpty() {
        if !recipeList.isEmpty {
            recipeList.removeAll()
        }
    }
    
    func search(text: String) {
        recipeList = originalRecipeList.filter{ $0.title.lowercased().contains(text.lowercased()) }
    }
}

//
//  ResponseModel.swift
//  Food_Recipes
//
//  Created by NourAllah Ahmed on 5/7/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import Foundation


struct RootClass: Codable {

let results: [Results]?
let offset: Int?
let number: Int?
let totalResults: Int?

}
//MARK:- Results
struct Results: Codable {

    let vegetarian: Bool?
    let vegan: Bool?
//    let glutenFree: Bool?
//    let dairyFree: Bool?
    let veryHealthy: Bool?
//    let cheap: Bool?
//    let veryPopular: Bool?
//    let sustainable: Bool?
//    let weightWatcherSmartPoints: Int?
//    let gaps: String?
//    let lowFodmap: Bool?
//    let aggregateLikes: Int?
//    let spoonacularScore: Int?
    let healthScore: Int?
//    let creditsText: String?
//    let license: String?
    let sourceName: String?
//    let pricePerServing: Double?
    let extendedIngredients: [ExtendedIngredients]?
    let id: Int?
    let title: String?
    let readyInMinutes: Int?
//    let servings: Int?
//    let sourceUrl: String?
    let image: String?
    let imageType: String?
    let summary: String?
//    let cuisines: [String]?
    let dishTypes: [String]?
//    let diets: [String]?
//    let occasions: [Any]?
    
//
    let analyzedInstructions: [AnalyzedInstructions]?
//    let spoonacularSourceUrl: String?
//    let usedIngredientCount: Int?
//    let missedIngredientCount: Int?
//    let missedIngredients: [MissedIngredients]?
//    let likes: Int?
//
    
    
//    let usedIngredients: [Any]?
//    let unusedIngredients: [Any]?

    
    //MARK:- ExtendedIngredients
    struct ExtendedIngredients: Codable {

        let id: Int?
//        let aisle: String?
        let image: String?
//        let consistency: String?
        let name: String?
//        let nameClean: String?
//        let original: String?
//        let originalName: String?
        let amount: Double?
        let unit: String?
//        let meta: [String]?
//        let measures: Measures?
    

    }

    
    
    //MARK:- Measures
    struct Measures: Codable {

        let us: Us?
        let metric: Metric?

    }
    
    
    //MARK:- US
    struct Us: Codable {

        let amount: Int?
        let unitShort: String?
        let unitLong: String?

    }
    
//MARK:- metric
    struct Metric: Codable {

        let amount: Double?
        let unitShort: String?
        let unitLong: String?

    }
    //MARK:- AnalyzedInstructions
    struct AnalyzedInstructions: Codable {

        let name: String?
        let steps: [Steps]?

    }
    
    
    //MARK:- Steps

    struct Steps: Codable {

        let number: Int?
        let step: String?
        let ingredients: [Ingredients]?
        let equipment: [Equipment]?

    }
    
    
    //MARK:- Ingredients

    struct Ingredients: Codable {

        let id: Int?
        let name: String?
        let localizedName: String?
        let image: String?

    }
    
    //MARK:- Equipment

    struct Equipment: Codable {

        let id: Int?
        let name: String?
        let localizedName: String?
        let image: String?

    }
    
    //MARK:- MissedIngredients

    struct MissedIngredients: Codable {

        let id: Int?
        let amount: Int?
        let unit: String?
        let unitLong: String?
        let unitShort: String?
        let aisle: String?
        let name: String?
        let original: String?
        let originalName: String?
        let meta: [String]?
        let extendedName: String?
        let image: String?

    }
}

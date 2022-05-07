//
//  ResponseModel.swift
//  Food_Recipes
//
//  Created by NourAllah Ahmed on 5/7/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import Foundation


//MARK:- Results
struct Results: Codable {

    let vegetarian: Bool?
    let vegan: Bool?
    let glutenFree: Bool?
    let dairyFree: Bool?
    let veryHealthy: Bool?
    let cheap: Bool?
    let veryPopular: Bool?
    let sustainable: Bool?
    let weightWatcherSmartPoints: Int?
    let gaps: String?
    let lowFodmap: Bool?
    let aggregateLikes: Int?
    let spoonacularScore: Int?
    let healthScore: Int?
    let creditsText: String?
    let license: String?
    let sourceName: String?
    let pricePerServing: Double?
    let extendedIngredients: [ExtendedIngredients]?
    let id: Int?
    let title: String?
    let readyInMinutes: Int?
    let servings: Int?
    let sourceUrl: String?
    let image: String?
    let imageType: String?
    let summary: String?
    let cuisines: [String]?
    let dishTypes: [String]?
    let diets: [String]?
//    let occasions: [Any]?
    let analyzedInstructions: [AnalyzedInstructions]?
    let spoonacularSourceUrl: String?
    let usedIngredientCount: Int?
    let missedIngredientCount: Int?
    let missedIngredients: [MissedIngredients]?
    let likes: Int?
//    let usedIngredients: [Any]?
//    let unusedIngredients: [Any]?
/*
    private enum CodingKeys: String, CodingKey {
        case vegetarian = "vegetarian"
        case vegan = "vegan"
        case glutenFree = "glutenFree"
        case dairyFree = "dairyFree"
        case veryHealthy = "veryHealthy"
        case cheap = "cheap"
        case veryPopular = "veryPopular"
        case sustainable = "sustainable"
        case weightWatcherSmartPoints = "weightWatcherSmartPoints"
        case gaps = "gaps"
        case lowFodmap = "lowFodmap"
        case aggregateLikes = "aggregateLikes"
        case spoonacularScore = "spoonacularScore"
        case healthScore = "healthScore"
        case creditsText = "creditsText"
        case license = "license"
        case sourceName = "sourceName"
        case pricePerServing = "pricePerServing"
        case extendedIngredients = "extendedIngredients"
        case id = "id"
        case title = "title"
        case readyInMinutes = "readyInMinutes"
        case servings = "servings"
        case sourceUrl = "sourceUrl"
        case image = "image"
        case imageType = "imageType"
        case summary = "summary"
        case cuisines = "cuisines"
        case dishTypes = "dishTypes"
        case diets = "diets"
        case occasions = "occasions"
        case analyzedInstructions = "analyzedInstructions"
        case spoonacularSourceUrl = "spoonacularSourceUrl"
        case usedIngredientCount = "usedIngredientCount"
        case missedIngredientCount = "missedIngredientCount"
        case missedIngredients = "missedIngredients"
        case likes = "likes"
        case usedIngredients = "usedIngredients"
        case unusedIngredients = "unusedIngredients"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vegetarian = try values.decode(Bool.self, forKey: .vegetarian)
        vegan = try values.decode(Bool.self, forKey: .vegan)
        glutenFree = try values.decode(Bool.self, forKey: .glutenFree)
        dairyFree = try values.decode(Bool.self, forKey: .dairyFree)
        veryHealthy = try values.decode(Bool.self, forKey: .veryHealthy)
        cheap = try values.decode(Bool.self, forKey: .cheap)
        veryPopular = try values.decode(Bool.self, forKey: .veryPopular)
        sustainable = try values.decode(Bool.self, forKey: .sustainable)
        weightWatcherSmartPoints = try values.decode(Int.self, forKey: .weightWatcherSmartPoints)
        gaps = try values.decode(String.self, forKey: .gaps)
        lowFodmap = try values.decode(Bool.self, forKey: .lowFodmap)
        aggregateLikes = try values.decode(Int.self, forKey: .aggregateLikes)
        spoonacularScore = try values.decode(Int.self, forKey: .spoonacularScore)
        healthScore = try values.decode(Int.self, forKey: .healthScore)
        creditsText = try values.decode(String.self, forKey: .creditsText)
        license = try values.decode(String.self, forKey: .license)
        sourceName = try values.decode(String.self, forKey: .sourceName)
        pricePerServing = try values.decode(Double.self, forKey: .pricePerServing)
        extendedIngredients = try values.decode([ExtendedIngredients].self, forKey: .extendedIngredients)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        readyInMinutes = try values.decode(Int.self, forKey: .readyInMinutes)
        servings = try values.decode(Int.self, forKey: .servings)
        sourceUrl = try values.decode(String.self, forKey: .sourceUrl)
        image = try values.decode(String.self, forKey: .image)
        imageType = try values.decode(String.self, forKey: .imageType)
        summary = try values.decode(String.self, forKey: .summary)
        cuisines = try values.decode([String].self, forKey: .cuisines)
        dishTypes = try values.decode([String].self, forKey: .dishTypes)
        diets = try values.decode([String].self, forKey: .diets)
        occasions = [] // TODO: Add code for decoding `occasions`, It was empty at the time of model creation.
        analyzedInstructions = try values.decode([AnalyzedInstructions].self, forKey: .analyzedInstructions)
        spoonacularSourceUrl = try values.decode(String.self, forKey: .spoonacularSourceUrl)
        usedIngredientCount = try values.decode(Int.self, forKey: .usedIngredientCount)
        missedIngredientCount = try values.decode(Int.self, forKey: .missedIngredientCount)
        missedIngredients = try values.decode([MissedIngredients].self, forKey: .missedIngredients)
        likes = try values.decode(Int.self, forKey: .likes)
        usedIngredients = [] // TODO: Add code for decoding `usedIngredients`, It was empty at the time of model creation.
        unusedIngredients = [] // TODO: Add code for decoding `unusedIngredients`, It was empty at the time of model creation.
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(vegetarian, forKey: .vegetarian)
        try container.encode(vegan, forKey: .vegan)
        try container.encode(glutenFree, forKey: .glutenFree)
        try container.encode(dairyFree, forKey: .dairyFree)
        try container.encode(veryHealthy, forKey: .veryHealthy)
        try container.encode(cheap, forKey: .cheap)
        try container.encode(veryPopular, forKey: .veryPopular)
        try container.encode(sustainable, forKey: .sustainable)
        try container.encode(weightWatcherSmartPoints, forKey: .weightWatcherSmartPoints)
        try container.encode(gaps, forKey: .gaps)
        try container.encode(lowFodmap, forKey: .lowFodmap)
        try container.encode(aggregateLikes, forKey: .aggregateLikes)
        try container.encode(spoonacularScore, forKey: .spoonacularScore)
        try container.encode(healthScore, forKey: .healthScore)
        try container.encode(creditsText, forKey: .creditsText)
        try container.encode(license, forKey: .license)
        try container.encode(sourceName, forKey: .sourceName)
        try container.encode(pricePerServing, forKey: .pricePerServing)
        try container.encode(extendedIngredients, forKey: .extendedIngredients)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(readyInMinutes, forKey: .readyInMinutes)
        try container.encode(servings, forKey: .servings)
        try container.encode(sourceUrl, forKey: .sourceUrl)
        try container.encode(image, forKey: .image)
        try container.encode(imageType, forKey: .imageType)
        try container.encode(summary, forKey: .summary)
        try container.encode(cuisines, forKey: .cuisines)
        try container.encode(dishTypes, forKey: .dishTypes)
        try container.encode(diets, forKey: .diets)
        // TODO: Add code for encoding `occasions`, It was empty at the time of model creation.
        try container.encode(analyzedInstructions, forKey: .analyzedInstructions)
        try container.encode(spoonacularSourceUrl, forKey: .spoonacularSourceUrl)
        try container.encode(usedIngredientCount, forKey: .usedIngredientCount)
        try container.encode(missedIngredientCount, forKey: .missedIngredientCount)
        try container.encode(missedIngredients, forKey: .missedIngredients)
        try container.encode(likes, forKey: .likes)
        // TODO: Add code for encoding `usedIngredients`, It was empty at the time of model creation.
        // TODO: Add code for encoding `unusedIngredients`, It was empty at the time of model creation.
    }
    */
    
    //MARK:- ExtendedIngredients
    struct ExtendedIngredients: Codable {

        let id: Int?
        let aisle: String?
        let image: String?
        let consistency: String?
        let name: String?
        let nameClean: String?
        let original: String?
        let originalName: String?
        let amount: Int?
        let unit: String?
        let meta: [String]?
        let measures: Measures?
/*
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case aisle = "aisle"
            case image = "image"
            case consistency = "consistency"
            case name = "name"
            case nameClean = "nameClean"
            case original = "original"
            case originalName = "originalName"
            case amount = "amount"
            case unit = "unit"
            case meta = "meta"
            case measures = "measures"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decode(Int.self, forKey: .id)
            aisle = try values.decode(String.self, forKey: .aisle)
            image = try values.decode(String.self, forKey: .image)
            consistency = try values.decode(String.self, forKey: .consistency)
            name = try values.decode(String.self, forKey: .name)
            nameClean = try values.decode(String.self, forKey: .nameClean)
            original = try values.decode(String.self, forKey: .original)
            originalName = try values.decode(String.self, forKey: .originalName)
            amount = try values.decode(Int.self, forKey: .amount)
            unit = try values.decode(String.self, forKey: .unit)
            meta = try values.decode([String].self, forKey: .meta)
            measures = try values.decode(Measures.self, forKey: .measures)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(aisle, forKey: .aisle)
            try container.encode(image, forKey: .image)
            try container.encode(consistency, forKey: .consistency)
            try container.encode(name, forKey: .name)
            try container.encode(nameClean, forKey: .nameClean)
            try container.encode(original, forKey: .original)
            try container.encode(originalName, forKey: .originalName)
            try container.encode(amount, forKey: .amount)
            try container.encode(unit, forKey: .unit)
            try container.encode(meta, forKey: .meta)
            try container.encode(measures, forKey: .measures)
        }
*/
    }

    
    
    //MARK:- Measures
    struct Measures: Codable {

        let us: Us?
        let metric: Metric?
/*
        private enum CodingKeys: String, CodingKey {
            case us = "us"
            case metric = "metric"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            us = try values.decode(Us.self, forKey: .us)
            metric = try values.decode(Metric.self, forKey: .metric)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(us, forKey: .us)
            try container.encode(metric, forKey: .metric)
        }
*/
    }
    
    
    //MARK:- US
    struct Us: Codable {

        let amount: Int?
        let unitShort: String?
        let unitLong: String?
/*
        private enum CodingKeys: String, CodingKey {
            case amount = "amount"
            case unitShort = "unitShort"
            case unitLong = "unitLong"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            amount = try values.decode(Int.self, forKey: .amount)
            unitShort = try values.decode(String.self, forKey: .unitShort)
            unitLong = try values.decode(String.self, forKey: .unitLong)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(amount, forKey: .amount)
            try container.encode(unitShort, forKey: .unitShort)
            try container.encode(unitLong, forKey: .unitLong)
        }
*/
    }
    
//MARK:- metric
    struct Metric: Codable {

        let amount: Double?
        let unitShort: String?
        let unitLong: String?
/*
        private enum CodingKeys: String, CodingKey {
            case amount = "amount"
            case unitShort = "unitShort"
            case unitLong = "unitLong"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            amount = try values.decode(Double.self, forKey: .amount)
            unitShort = try values.decode(String.self, forKey: .unitShort)
            unitLong = try values.decode(String.self, forKey: .unitLong)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(amount, forKey: .amount)
            try container.encode(unitShort, forKey: .unitShort)
            try container.encode(unitLong, forKey: .unitLong)
        }
*/
    }
    //MARK:- AnalyzedInstructions
    struct AnalyzedInstructions: Codable {

        let name: String?
        let steps: [Steps]?
/*
        private enum CodingKeys: String, CodingKey {
            case name = "name"
            case steps = "steps"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decode(String.self, forKey: .name)
            steps = try values.decode([Steps].self, forKey: .steps)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encode(steps, forKey: .steps)
        }
*/
    }
    
    
    //MARK:- Steps

    struct Steps: Codable {

        let number: Int?
        let step: String?
        let ingredients: [Ingredients]?
        let equipment: [Equipment]?
/*
        private enum CodingKeys: String, CodingKey {
            case number = "number"
            case step = "step"
            case ingredients = "ingredients"
            case equipment = "equipment"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            number = try values.decode(Int.self, forKey: .number)
            step = try values.decode(String.self, forKey: .step)
            ingredients = try values.decode([Ingredients].self, forKey: .ingredients)
            equipment = try values.decode([Equipment].self, forKey: .equipment)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(number, forKey: .number)
            try container.encode(step, forKey: .step)
            try container.encode(ingredients, forKey: .ingredients)
            try container.encode(equipment, forKey: .equipment)
        }
*/
    }
    
    
    //MARK:- Ingredients

    struct Ingredients: Codable {

        let id: Int?
        let name: String?
        let localizedName: String?
        let image: String?
/*
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case localizedName = "localizedName"
            case image = "image"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decode(Int.self, forKey: .id)
            name = try values.decode(String.self, forKey: .name)
            localizedName = try values.decode(String.self, forKey: .localizedName)
            image = try values.decode(String.self, forKey: .image)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(name, forKey: .name)
            try container.encode(localizedName, forKey: .localizedName)
            try container.encode(image, forKey: .image)
        }
*/
    }
    
    //MARK:- Equipment

    struct Equipment: Codable {

        let id: Int?
        let name: String?
        let localizedName: String?
        let image: String?
/*
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case localizedName = "localizedName"
            case image = "image"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decode(Int.self, forKey: .id)
            name = try values.decode(String.self, forKey: .name)
            localizedName = try values.decode(String.self, forKey: .localizedName)
            image = try values.decode(String.self, forKey: .image)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(name, forKey: .name)
            try container.encode(localizedName, forKey: .localizedName)
            try container.encode(image, forKey: .image)
        }
*/
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
/*
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case amount = "amount"
            case unit = "unit"
            case unitLong = "unitLong"
            case unitShort = "unitShort"
            case aisle = "aisle"
            case name = "name"
            case original = "original"
            case originalName = "originalName"
            case meta = "meta"
            case extendedName = "extendedName"
            case image = "image"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decode(Int.self, forKey: .id)
            amount = try values.decode(Int.self, forKey: .amount)
            unit = try values.decode(String.self, forKey: .unit)
            unitLong = try values.decode(String.self, forKey: .unitLong)
            unitShort = try values.decode(String.self, forKey: .unitShort)
            aisle = try values.decode(String.self, forKey: .aisle)
            name = try values.decode(String.self, forKey: .name)
            original = try values.decode(String.self, forKey: .original)
            originalName = try values.decode(String.self, forKey: .originalName)
            meta = try values.decode([String].self, forKey: .meta)
            extendedName = try values.decode(String.self, forKey: .extendedName)
            image = try values.decode(String.self, forKey: .image)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(amount, forKey: .amount)
            try container.encode(unit, forKey: .unit)
            try container.encode(unitLong, forKey: .unitLong)
            try container.encode(unitShort, forKey: .unitShort)
            try container.encode(aisle, forKey: .aisle)
            try container.encode(name, forKey: .name)
            try container.encode(original, forKey: .original)
            try container.encode(originalName, forKey: .originalName)
            try container.encode(meta, forKey: .meta)
            try container.encode(extendedName, forKey: .extendedName)
            try container.encode(image, forKey: .image)
        }
*/
    }
}
